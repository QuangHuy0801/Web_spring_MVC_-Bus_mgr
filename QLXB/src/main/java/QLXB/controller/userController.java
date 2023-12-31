package QLXB.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import QLXB.entity.ChucVu;
import QLXB.entity.NhanVien;
import QLXB.entity.TaiKhoan;




@Transactional
@Controller
public class userController {
	@Autowired
	SessionFactory factory;
	@Autowired
	ServletContext context;
	
	@RequestMapping("index")
	public String welcome(HttpServletRequest request, ModelMap model) {
		model.addAttribute("taiKhoan", new TaiKhoan());
		return "login/login";
	}
	
	@RequestMapping("/quenmatkhau")
	public String quenmatkhau(HttpServletRequest request, ModelMap model) {
		return "login/quenmatkhau";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(ModelMap model, HttpServletRequest request, @ModelAttribute("taiKhoan") TaiKhoan taiKhoan,
			BindingResult errors) {
		boolean kt = true;
		if (taiKhoan.getMaNV().trim().length() == 0) {
			errors.rejectValue("maNV", "taiKhoan", "Vui lòng nhập username !");
			kt = false;
		}
		if (taiKhoan.getPASSWORD().trim().length() == 0) {
			errors.rejectValue("PASSWORD", "taiKhoan", "Vui lòng nhập password !");
			kt = false;
		}
		else if (taiKhoan.getPASSWORD().trim().length() < 5) {
			errors.rejectValue("PASSWORD", "taiKhoan", "Password phải từ 5 kí tự trở lên!");
			kt = false;
		}
		if (kt == true) {
			HttpSession session = request.getSession();
			session.setMaxInactiveInterval(36000);
			String username = taiKhoan.getMaNV();
			String password = taiKhoan.getPASSWORD();
			TaiKhoan taikhoan = queryLogin(username, password);
			if (taikhoan != null) {
				if (taikhoan.getNhanVien().getTrangThai() == 1 && taikhoan.getHoatDong()==1) {

					session.setAttribute("TaiKhoan", taikhoan);
						return "home/homeshow";
				} else {
					model.addAttribute("error", "Tài khoản đã ngừng hoạt động !!!");
					return "login/login";
				}
			} else
				model.addAttribute("error", "Mã tài khoản hoặc mật khẩu chưa đúng !!!");
		}
		return "login/login";

	}
	
	
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		// Xóa thông tin người dùng khỏi phiên làm việc và kết thúc phiên
		session.removeAttribute("TaiKhoan");
		/* session.removeAttribute("quyenHan"); */
		session.invalidate();
		return "redirect:/index.htm";
	}
	
	
	@RequestMapping(value = "doimatkhau")
	public String doimatkhau(ModelMap model, HttpSession session) {
		TaiKhoan taiKhoan = (TaiKhoan) session.getAttribute("TaiKhoan");
		model.addAttribute("username", taiKhoan.getMaNV());
		model.addAttribute("message1", "");
		return "home/doimatkhau";
	}

	@RequestMapping(value = "/thaydoimatkhau", method = RequestMethod.POST)
	public String doiMatKhau(HttpSession session1, ModelMap model, HttpServletRequest request) {
		TaiKhoan taiKhoan = (TaiKhoan) session1.getAttribute("TaiKhoan");
		String username = taiKhoan.getMaNV().trim();
		model.addAttribute("username", username);
		TaiKhoan check = searchTaiKhoan(username);
		String mk = request.getParameter("password");
		if (!mk.equals(check.getPASSWORD().trim())) {
			model.addAttribute("message1", "** Mật khẩu cũ không chính xác !");
			return "home/doimatkhau";
		}
		String mk1 = request.getParameter("password1");
		
		if(mk1.length()<=5) {model.addAttribute("message1", "** Mật khẩu mới quá ngắn !");return "home/doimatkhau";}
		 else if (mk.equals(mk1)) {
			model.addAttribute("message1", "** Mật khẩu mới không thể trùng với mật khẩu cũ !");
			return "home/doimatkhau";
		}
		String mk2 = request.getParameter("password2");
		if (!mk1.equals(mk2)) {
			model.addAttribute("message1", "** Xác nhận mật khẩu không chính xác !");
			return "home/doimatkhau";
		}
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			check.setPASSWORD(mk1);
			session.update(check);
			t.commit();
			return "redirect:/logout.htm";

		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Đổi mật khẩu thất bại !");
		} finally {
			session.close();
		}

		return "home/doimatkhau";
	}
	@RequestMapping(value = "suattcanhan")
	public String suattcanhan(ModelMap model, HttpSession session) {
		TaiKhoan taiKhoan = (TaiKhoan) session.getAttribute("TaiKhoan");
		model.addAttribute("nhanVien1", taiKhoan.getNhanVien());
		return "home/suattcanhan";
	}

	@RequestMapping(value = "updatettcanhan", method = RequestMethod.POST)
	public String suattcanhan(@ModelAttribute("nhanVien1") NhanVien nhanVien, ModelMap model, BindingResult errors) {

		boolean kt = true;
		if (nhanVien.getHo().trim().length() == 0) {
			errors.rejectValue("ho", "nhanVien", "Vui lòng nhập họ!");
			kt = false;
		}
		if (nhanVien.getTen().trim().length() == 0) {
			errors.rejectValue("ten", "nhanVien", "Vui lòng nhập tên !");
			kt = false;
		}
		if (nhanVien.getcCCD().trim().length() == 0) {
			errors.rejectValue("cCCD", "nhanVien", "Vui lòng nhập CCCD !");
			kt = false;
		}
		if (kt == true) {

			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
				nhanVien.setTrangThai(1);
				session.update(nhanVien);
				t.commit();
				model.addAttribute("message", 1);
			} catch (Exception e) {
				t.rollback();
				model.addAttribute("message", 2);

			} finally {
				session.close();
			}
		}
		model.addAttribute("nhanVien1", nhanVien);
		return "home/suattcanhan";
	}
	
	@RequestMapping("homeshow")
	public String homeshow1(ModelMap model) {
		return "home/homeshow";
	}
	
	@RequestMapping(value = "danhsachnhanvien")
	public String danhsachtaikhoan(HttpServletRequest request, ModelMap model,@RequestParam(defaultValue = "0") int page,@RequestParam(defaultValue = "") String timkiem,
			@ModelAttribute("message") String message) {
		int pageSize = 6;
		int totalUsers = getSize(timkiem);
		System.out.println(12345);
		System.out.println(totalUsers);
		System.out.println(page);
		List<NhanVien> thongTinNhanVien = this.getNhanVien(page,pageSize,timkiem);
	    int totalPages = (int) Math.ceil((double) totalUsers / pageSize);
	    if(totalPages==0) {
			totalPages=1;
		}
	    model.addAttribute("timkiem", timkiem);
	    model.addAttribute("totalPages", totalPages);
	    model.addAttribute("currentPage", page);
		model.addAttribute("nhanviens", thongTinNhanVien);
		model.addAttribute("message", message);
		return "nhanvien/dsnhanvien";
	}
	@RequestMapping(value = "themnhanvien")
	public String themnhanvien(HttpServletRequest request, ModelMap model) {
		NhanVien nhanVien = new NhanVien();
		TaiKhoan taiKhoan = new TaiKhoan();
		nhanVien.setTaiKhoan(taiKhoan);
		nhanVien.setChucVu(getChucVus().get(0));
		model.addAttribute("nhanvien", nhanVien);
		model.addAttribute("chucvus", getChucVus());
		return "nhanvien/themnhanvien";
	}
	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public String insertdiemdulich(HttpServletRequest request, @ModelAttribute("nhanvien") NhanVien nhanVien,
			ModelMap model, BindingResult errors) {

		boolean kt = true;
		if (nhanVien.getMaNV().trim().length() == 0) {
			errors.rejectValue("maNV", "nhanVien", "Vui lòng nhập mã nhân viên !");
			kt = false;
		}
		if (searchNhanVien(nhanVien.getMaNV()) != null) {
			errors.rejectValue("maNV", "nhanVien", "Mã nhân viên bị trùng !");
			kt = false;
		}
		if (nhanVien.getHo().trim().length() == 0) {
			errors.rejectValue("ho", "nhanVien", "Vui lòng nhập họ!");
			kt = false;
		}
		if (nhanVien.getTen().trim().length() == 0) {
			errors.rejectValue("ten", "nhanVien", "Vui lòng nhập tên !");
			kt = false;
		}
		if (nhanVien.getcCCD().trim().length() == 0) {
			errors.rejectValue("cCCD", "nhanVien", "Vui lòng nhập CCCD !");
			kt = false;
		}
		if (checkTrungCCCD(nhanVien.getcCCD()) == 1) {
			errors.rejectValue("cCCD", "nhanVien", "CCCD đã bị trùng !");
			kt = false;
		}
		if (kt == true) {
			Session session = factory.openSession();
			Transaction tr = session.beginTransaction();
			nhanVien.setTrangThai(1);
			ChucVu chucVu =searchsChucVu(nhanVien.getChucVu().getId()) ;
			if(chucVu.getId()==1||chucVu.getId()==8) {
			try {
				String mkDefault = "123456";
				TaiKhoan tk = new TaiKhoan();
				tk.setMaNV(mkDefault);
				tk.setPASSWORD(mkDefault);
				tk.setHoatDong(1);
				tk.setNhanVien(nhanVien);
				session.save(nhanVien);
				session.save(tk);
				tr.commit();
				model.addAttribute("message", 1);
			} catch (Exception e) {
				tr.rollback();
				model.addAttribute("message", 2);
			} finally {
				session.close();
			}}
			else {try {
				
				session.save(nhanVien);
				
				tr.commit();
				model.addAttribute("message", 1);
			} catch (Exception e) {
				tr.rollback();
				model.addAttribute("message", 2);
			} finally {
				session.close();
			}
				
			}
		}
		
		model.addAttribute("chucvus", getChucVus());
		return "nhanvien/themnhanvien";
	}
	@RequestMapping(value = "suanhanvien/{maNV}")
	
	public String suanhanvien(ModelMap model, @PathVariable String maNV) {
		model.addAttribute("nhanvien", this.searchNhanVien(maNV));
		model.addAttribute("chucvus", getChucVus());
		return "nhanvien/suanhanvien";
	}
	
	
	@RequestMapping(value = "suanhanvien/update", method = RequestMethod.POST)
	public String editNhanVien(@ModelAttribute("nhanvien") NhanVien nhanVien, ModelMap model, BindingResult errors) {

		boolean kt = true;
		if (nhanVien.getHo().trim().length() == 0) {
			errors.rejectValue("ho", "nhanVien", "Vui lòng nhập họ!");
			kt = false;
		}
		if (nhanVien.getTen().trim().length() == 0) {
			errors.rejectValue("ten", "nhanVien", "Vui lòng nhập tên !");
			kt = false;
		}
		if (nhanVien.getcCCD().trim().length() == 0) {
			errors.rejectValue("cCCD", "nhanVien", "Vui lòng nhập CCCD !");
			kt = false;
		}
		if (kt == true) {

			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
				session.update(nhanVien);
				t.commit();
				model.addAttribute("message", 1);
			} catch (Exception e) {
				t.rollback();
				model.addAttribute("message", 2);

			} finally {
				session.close();
			}
		}
		model.addAttribute("nhanvien", nhanVien);
		model.addAttribute("chucvus", getChucVus());
		return "nhanvien/suanhanvien";
	}
	
	
	
	@RequestMapping(value = "xoanhanvien/{maNV}")
	public String xoanhanvien(ModelMap model, @PathVariable String maNV) {
		NhanVien nhanVien = searchNhanVien(maNV);
		TaiKhoan taiKhoan = nhanVien.getTaiKhoan();
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		ChucVu chucVu =searchsChucVu(nhanVien.getChucVu().getId()) ;
		if(chucVu.getId()==1||chucVu.getId()==8) {
		try {
			String hql2 = "delete from TaiKhoan where maNV =:maNV ";
			String hql1 = "delete from NhanVien where maNV=:maNV";

			Query query2 = session.createQuery(hql2);
			query2.setParameter("maNV", maNV);
			int result2 = query2.executeUpdate();
			Query query1 = session.createQuery(hql1);
			query1.setParameter("maNV", maNV);
			int result1 = query1.executeUpdate();

			t.commit();

			model.addAttribute("message", 1);
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", 2);

		} finally {
			session.close();
		}}
		else {
			try {
			String hql1 = "delete from NhanVien where maNV=:maNV";
			Query query1 = session.createQuery(hql1);
			query1.setParameter("maNV", maNV);
			int result1 = query1.executeUpdate();

			t.commit();

			model.addAttribute("message", 1);
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", 2);

		} finally {
			session.close();
		}
			
		}

		return "redirect:/danhsachnhanvien.htm";
	}
	
	
	
	
	
	
	
	
	
	
	public List<NhanVien> getNhanVien(int page, int pageSize, String ten) {
		Session session = factory.getCurrentSession();
		String hql;
		Query query;
		List<NhanVien> list;
		if (ten.length() == 0 )
		{
			hql ="FROM NhanVien t ORDER BY maNV ASC";
			query = session.createQuery(hql);
			int offset = page * pageSize;
			list = query.setFirstResult(offset).setMaxResults(pageSize).list();
		} else
		{
			hql ="FROM NhanVien t where t.ten LIKE CONCAT( :ten, '%') ORDER BY t.ten ASC";
			query = session.createQuery(hql);
			int offset = page * pageSize;
			query.setParameter("ten", ten);
			list = query.setFirstResult(offset).setMaxResults(pageSize).list();
		}
		return list;
	}
	
	public int  getSize(String ten) {
		
		Session session = factory.getCurrentSession();
		String hql;
		Query query;
		if (ten.length() == 0 )
		{ hql = "FROM NhanVien";
		query = session.createQuery(hql);}
		else { hql = "FROM NhanVien t where t.ten LIKE CONCAT( :ten, '%')ORDER BY t.ten ASC";
		
		query = session.createQuery(hql);
		query.setParameter("ten", ten);}
		List<NhanVien> list = query.list();
		if(list==null)return 0;

		return list.size();
	}
	
	public TaiKhoan queryLogin(String username, String password) {

		Session session = factory.getCurrentSession();

		String hql = "FROM TaiKhoan WHERE maNV= :USERNAME AND PASSWORD = :PASSWORD";
		Query query = session.createQuery(hql);
		query.setParameter("USERNAME", username);
		query.setParameter("PASSWORD", password);
		if (query.list().size() == 0) {
			return null;
		}
		return (TaiKhoan) query.list().get(0);
	}
	public List<ChucVu> getChucVus() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ChucVu";
		List<ChucVu> chucVus = session.createQuery(hql).list();
		return chucVus;
	}
	public NhanVien searchNhanVien(String maNV) {
		Session session = factory.getCurrentSession();
		String hql = "FROM NhanVien WHERE maNV = :maNV";
		Query query = session.createQuery(hql);
		query.setParameter("maNV", maNV);
		if (query.list().size() == 0)
			return null;
		return (NhanVien) query.list().get(0);
	}
	public ChucVu searchsChucVu(int id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ChucVu WHERE id = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		if (query.list().size() == 0)
			return null;
		return (ChucVu) query.list().get(0);
	}
	private int checkTrungCCCD(String cCCD) {
		Session session = factory.getCurrentSession();
		String hql = "FROM NhanVien where cCCD = :cCCD";
		Query query = session.createQuery(hql);
		query.setParameter("cCCD", cCCD);
		List<NhanVien> list = query.list();
		if (list.size() == 0)
			return 0;
		return 1;
	}
	public TaiKhoan searchTaiKhoan(String maNV) {
		Session session = factory.getCurrentSession();
		String hql = "FROM TaiKhoan WHERE maNV = :maNV";
		Query query = session.createQuery(hql);
		query.setParameter("maNV", maNV);
		if (query.list().size() == 0)
			return null;
		return (TaiKhoan) query.list().get(0);
	}
}
