package QLXB.controller;

import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.annotations.reflection.XMLContext.Default;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.style.DefaultValueStyler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import QLXB.entity.CT_Tuyen_Duong;
import QLXB.entity.ChucVu;
import QLXB.entity.DoanhThuNgay;
import QLXB.entity.DoanhThuTram;
import QLXB.entity.GiaVe;
import QLXB.entity.NhanVien;
import QLXB.entity.TaiKhoan;
import QLXB.entity.TramVe;
import QLXB.entity.TramXe;
import QLXB.entity.TuyenDuong;
import QLXB.entity.Xe;

@Transactional
@Controller
public class qlchungController {
	@Autowired
	SessionFactory factory;
	@Autowired
	ServletContext context;

	@RequestMapping("dsgiave")
	public String dsgiave(HttpServletRequest request, ModelMap model, @RequestParam(defaultValue = "0") int page,
			@ModelAttribute("message") String message) {
		int pageSize = 6;
		int totalUsers = getSizGiaVe();
		List<GiaVe> giaves = this.getGiaVes(page, pageSize);
		int totalPages = (int) Math.ceil((double) totalUsers / pageSize);
		if (totalPages == 0) {
			totalPages = 1;
		}
		model.addAttribute("offset", page * pageSize);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("currentPage", page);
		model.addAttribute("giaves", giaves);
		model.addAttribute("message", message);
		return "giave/dsgiave";
	}

	public int getSizGiaVe() {
		Session session = factory.getCurrentSession();
		String hql = "FROM GiaVe";
		Query query = session.createQuery(hql);
		List<GiaVe> list = query.list();

		return list.size();
	}

	public int getSizDoanhThuNgay() {
		Session session = factory.getCurrentSession();
		String hql = "FROM DoanhThuNgay";
		Query query = session.createQuery(hql);
		List<DoanhThuNgay> list = query.list();

		return list.size();
	}

	public List<GiaVe> getGiaVes(int page, int pageSize) {
		Session session = factory.getCurrentSession();
		String hql;
		Query query;
		List<GiaVe> list;
		hql = "FROM GiaVe t ORDER BY t.id DESC";
		query = session.createQuery(hql);
		int offset = page * pageSize;
		list = query.setFirstResult(offset).setMaxResults(pageSize).list();

		return list;
	}

	public List<DoanhThuNgay> getDoanhThuNgays(int page, int pageSize,String timkiem) {
		Session session = factory.getCurrentSession();
		String hql;
		Query query;
		List<DoanhThuNgay> list;
		if(timkiem.length()==0) {
		hql = "FROM DoanhThuNgay t ORDER BY t.tuyenDuong_dtn DESC";
		query = session.createQuery(hql);
		int offset = page * pageSize;
		list = query.setFirstResult(offset).setMaxResults(pageSize).list();}
	 else
	{
		hql ="FROM DoanhThuNgay t where t.tuyenDuong_dtn.ten LIKE CONCAT('%', :ten, '%') ORDER BY t.tuyenDuong_dtn.ten ASC";
		query = session.createQuery(hql);
		int offset = page * pageSize;
		query.setParameter("ten", timkiem);
		list = query.setFirstResult(offset).setMaxResults(pageSize).list();
	}

		return list;
	}

	@RequestMapping(value = "themgiave")
	public String themgiave(HttpServletRequest request, ModelMap model) {
		GiaVe giaVe = new GiaVe();
		model.addAttribute("giaVe", giaVe);

		return "giave/themgiave";
	}

	@RequestMapping(value = "insertgiave", method = RequestMethod.POST)
	public String insertgiave(HttpServletRequest request, @ModelAttribute("giaVe") GiaVe giaVe, ModelMap model,
			BindingResult errors) {

		boolean kt = true;
		if (giaVe.getGiaVeHSSV() <= 2000) {
			errors.rejectValue("giaVeHSSV", "giaVe", "Vui lòng nhập giá vé HSSV >2000đ !");
			kt = false;
		}
		if (giaVe.getGiaVeBT() <= 2000) {
			errors.rejectValue("giaVeBT", "giaVe", "Vui lòng nhập giá vé bình thường >2000đ !");
			kt = false;
		}
		if (giaVe.getGiaVeTap() <= 50000) {
			errors.rejectValue("giaVeTap", "giaVe", "Vui lòng nhập giá vé tập >50000đ !");
			kt = false;
		}
		if (kt == true) {
			Session session = factory.openSession();
			Transaction tr = session.beginTransaction();

			try {

				session.save(giaVe);
				tr.commit();
				model.addAttribute("message", 1);
			} catch (Exception e) {
				tr.rollback();
				model.addAttribute("message", 2);
			} finally {
				session.close();
			}

		}
		return "giave/themgiave";
	}

	@RequestMapping(value = "suagiave/{id}")

	public String suagiave(ModelMap model, @PathVariable int id) {
		model.addAttribute("giaVe", this.searchGiave(id));
		return "giave/suagiave";
	}

	@RequestMapping(value = "suagiave/updategiave", method = RequestMethod.POST)
	public String updatetramxe(@ModelAttribute("giaVe") GiaVe giaVe, ModelMap model, BindingResult errors) {

		boolean kt = true;
		if (giaVe.getGiaVeHSSV() <= 2000) {
			errors.rejectValue("giaVeHSSV", "giaVe", "Vui lòng nhập giá vé HSSV >2000đ !");
			kt = false;
		}
		if (giaVe.getGiaVeBT() <= 2000) {
			errors.rejectValue("giaVeBT", "giaVe", "Vui lòng nhập giá vé bình thường >2000đ !");
			kt = false;
		}
		if (giaVe.getGiaVeTap() <= 50000) {
			errors.rejectValue("giaVeTap", "giaVe", "Vui lòng nhập giá vé tập >50000đ !");
			kt = false;
		}
		if (kt == true) {

			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
				session.update(giaVe);
				t.commit();
				model.addAttribute("message", 1);
			} catch (Exception e) {
				t.rollback();
				model.addAttribute("message", 2);

			} finally {
				session.close();
			}
		}
		model.addAttribute("giaVe", giaVe);
		return "giave/suagiave";
	}

	@RequestMapping(value = "xoagiave/{id}")
	public String xoadiemdulich(ModelMap model, @PathVariable int id) {
		/* DiemDuLich diemDuLich = searchDiemDuLich(id); */

		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			/* session.delete(diemDuLich); */

			String hql = "delete from GiaVe where id=:id";

			Query query1 = session.createQuery(hql);
			query1.setParameter("id", id);
			int result1 = query1.executeUpdate();

			t.commit();
			model.addAttribute("message", 1);
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", 2);

		} finally {
			session.close();
		}

		return "redirect:/dsgiave.htm";
	}

	@RequestMapping("lichsunhap")
	public String lichsunhap(HttpServletRequest request, ModelMap model, @RequestParam(defaultValue = "0") int page,@RequestParam(defaultValue = "") String timkiem,
			@ModelAttribute("message") String message) {
		int pageSize = 6;
		int totalUsers = getSizDoanhThuNgay();
		List<DoanhThuNgay> doanhthungays = this.getDoanhThuNgays(page, pageSize,timkiem);
		int totalPages = (int) Math.ceil((double) totalUsers / pageSize);
		if (totalPages == 0) {
			totalPages = 1;
		}
		model.addAttribute("offset", page * pageSize);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("currentPage", page);
		model.addAttribute("doanhthungays", doanhthungays);
		model.addAttribute("message", message);
		return "nhapdoanhthu/lichsunhap";
	}
	
	
	@RequestMapping(value = "themdoanhthu")
	public String themdoanhthu(HttpServletRequest request, ModelMap model) {
		DoanhThuNgay doanhThuNgay = new DoanhThuNgay();
		model.addAttribute("doanhThuNgay", doanhThuNgay);
		model.addAttribute("tuyenduongs", getTuyenDuongs());
		return "nhapdoanhthu/themdoanhthu";
	}
	
	@RequestMapping(value = "insertdoanhthu", method = RequestMethod.POST)
	public String insertdoanhthu(HttpServletRequest request, @ModelAttribute("doanhThuNgay") DoanhThuNgay doanhThuNgay, ModelMap model,
			BindingResult errors) {

		boolean kt = true;
		if (doanhThuNgay.getNgay() ==null) {
			errors.rejectValue("ngay", "doanhThuNgay", "Vui lòng nhập ngày !");
			kt = false;
		}
		if (doanhThuNgay.getSoVeBT() <0 ) {
			errors.rejectValue("soVeBT", "doanhThuNgay", "Vui lòng nhập số vé bình thường !");
			kt = false;
		}
		if (doanhThuNgay.getSoVeHSSV() <0 ) {
			errors.rejectValue("soVeHSSV", "doanhThuNgay", "Vui lòng nhập số vé HSSV !");
			kt = false;
		}
		
		if (kt == true) {
			Session session = factory.openSession();
			Transaction tr = session.beginTransaction();

			try {

				session.save(doanhThuNgay);
				tr.commit();
				model.addAttribute("message", 1);
			} catch (Exception e) {
				tr.rollback();
				model.addAttribute("message", 2);
			} finally {
				session.close();
			}

		}
		model.addAttribute("tuyenduongs", getTuyenDuongs());
		return "nhapdoanhthu/themdoanhthu";
	}
	
	@RequestMapping(value = "suadoanhthu/{id}")

	public String suadoanhthu(ModelMap model, @PathVariable int id) {
		model.addAttribute("doanhThuNgay", this.searchDoanhThuNgay(id));
		model.addAttribute("tuyenduongs", getTuyenDuongs());
		return "nhapdoanhthu/suadoanhthu";
	}
	

	@RequestMapping(value = "suadoanhthu/updatedoanhthu", method = RequestMethod.POST)
	public String updatedoanhthu(HttpServletRequest request, @ModelAttribute("doanhThuNgay") DoanhThuNgay doanhThuNgay, ModelMap model,
			BindingResult errors) {

		
		boolean kt = true;
		if (doanhThuNgay.getNgay() ==null) {
			errors.rejectValue("ngay", "doanhThuNgay", "Vui lòng nhập ngày !");
			kt = false;
		}
		if (doanhThuNgay.getSoVeBT() <0 ) {
			errors.rejectValue("soVeBT", "doanhThuNgay", "Vui lòng nhập số vé bình thường !");
			kt = false;
		}
		if (doanhThuNgay.getSoVeHSSV() <0 ) {
			errors.rejectValue("soVeHSSV", "doanhThuNgay", "Vui lòng nhập số vé HSSV !");
			kt = false;
		}
		
		if (kt == true) {
			Session session = factory.openSession();
			Transaction tr = session.beginTransaction();

			try {

				session.update(doanhThuNgay);
				tr.commit();
				model.addAttribute("message", 1);
			} catch (Exception e) {
				tr.rollback();
				model.addAttribute("message", 2);
			} finally {
				session.close();
			}

		}
		model.addAttribute("tuyenduongs", getTuyenDuongs());
		return "nhapdoanhthu/suadoanhthu";
	}
	
	@RequestMapping(value = "xoadoanhthu/{id}")
	public String xoadoanhthu(ModelMap model, @PathVariable int id) {
		/* DiemDuLich diemDuLich = searchDiemDuLich(id); */

		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			/* session.delete(diemDuLich); */

			String hql = "delete from DoanhThuNgay where id=:id";

			Query query1 = session.createQuery(hql);
			query1.setParameter("id", id);
			int result1 = query1.executeUpdate();

			t.commit();
			model.addAttribute("message", 1);
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", 2);

		} finally {
			session.close();
		}

		return "redirect:/lichsunhap.htm";
	}
	
	@RequestMapping(value="doanhthutram/{id}")
	public String doanhthutram(ModelMap model ,@PathVariable int id,@ModelAttribute("message") String message,@RequestParam(defaultValue = "0") int currentPage,@RequestParam(defaultValue = "") String timkiem) {
		DoanhThuNgay doanhThuNgay= searchDoanhThuNgay(id);
		
int pageSize = 9; // Số lượng phần tử trên mỗi trang
		

		int totalUsers = getSizeDoanhThuTram(id); // Tổng số lượng phần tử trên toàn bộ danh sách
			List<DoanhThuTram> doanhThuTrams = this.geDoanhThuTrams(currentPage,pageSize,id,timkiem);
		    int totalPages = (int) Math.ceil((double) totalUsers / pageSize);
		    if(totalPages==0) {
				totalPages=1;
			}
			 model.addAttribute("totalPages", totalPages);
			    model.addAttribute("currentPage", currentPage);
			    model.addAttribute("offset", currentPage * pageSize);
			model.addAttribute("message", message);
			model.addAttribute("doanhThuTrams", doanhThuTrams);
			model.addAttribute("idDTN",id);
		return"nhapdoanhthu/doanhthutram";
	}
	
	@RequestMapping(value = "doanhthutram/themdoanhthutram/{id}")

	public String themdoanhthutram(ModelMap model, @PathVariable int id) {
		
		DoanhThuTram doanhThuTram= new DoanhThuTram();
		model.addAttribute("doanhThuTram", doanhThuTram);
		model.addAttribute("idDTN", id);
		model.addAttribute("tramves", geTramVes(id));
		return "nhapdoanhthu/themdoanhthutram";
	}
	
	@RequestMapping(value = "doanhthutram/themdoanhthutram/insertdoanhthutram", method = RequestMethod.POST)
	public String insertdoanhthutram(HttpServletRequest request, @ModelAttribute("doanhThuTram") DoanhThuTram doanhThuTram, ModelMap model,
			BindingResult errors) {
		boolean kt = true;
		if (doanhThuTram.getSoVeTap() <=0) {
			errors.rejectValue("soVeTap", "doanhThuTram", "Vui lòng nhập số vé tập !");
			kt = false;
		}
		if (kt == true) {
			Session session = factory.openSession();
			Transaction tr = session.beginTransaction();

			try {
				doanhThuTram.setDoanhThuNgay(searchDoanhThuNgay(doanhThuTram.getDoanhThuNgay().getId()));
				doanhThuTram.setTramVe(searchTramVe(doanhThuTram.getTramVe().getId()));
				session.save(doanhThuTram);
				tr.commit();
				model.addAttribute("message", 1);
			} catch (Exception e) {
				tr.rollback();
				model.addAttribute("message", 2);
			} finally {
				session.close();
			}

		}
		model.addAttribute("idDTN", doanhThuTram.getDoanhThuNgay().getId());
		model.addAttribute("tramves", geTramVes(doanhThuTram.getDoanhThuNgay().getId()));
		return "nhapdoanhthu/themdoanhthutram";
	}
	
	
	@RequestMapping(value = "doanhthutram/suadoanhthutram/{id}")
	public String suadoanhthutram(ModelMap model, @PathVariable int id) 
	
	{
		DoanhThuTram doanhThuTram=searchDoanhThuTram(id);
		model.addAttribute("doanhThuTram",doanhThuTram );
		List<TramVe> list= geTramVes(doanhThuTram.getDoanhThuNgay().getId());
		list.add(doanhThuTram.getTramVe());
		model.addAttribute("idDTN",doanhThuTram.getDoanhThuNgay().getId());
		model.addAttribute("tramves", list);
		return "nhapdoanhthu/suadoanhthutram";
	}
	
	@RequestMapping(value = "doanhthutram/suadoanhthutram/updatedoanhthutram", method = RequestMethod.POST)
	public String updatedoanhthutram(HttpServletRequest request, @ModelAttribute("doanhThuTram") DoanhThuTram doanhThuTram, ModelMap model,
			BindingResult errors) {

		
		boolean kt = true;
		if (doanhThuTram.getSoVeTap() <=0) {
			errors.rejectValue("soVeTap", "doanhThuTram", "Vui lòng nhập số vé tập !");
			kt = false;
		}
		if (kt == true) {
			Session session = factory.openSession();
			Transaction tr = session.beginTransaction();

			try {

				session.update(doanhThuTram);
				tr.commit();
				model.addAttribute("message", 1);
			} catch (Exception e) {
				tr.rollback();
				model.addAttribute("message", 2);
			} finally {
				session.close();
			}

		}model.addAttribute("idDTN",doanhThuTram.getDoanhThuNgay().getId());
		return "redirect:/doanhthutram/"+doanhThuTram.getDoanhThuNgay().getId()+".htm";
	}
	
	@RequestMapping(value = "doanhthutram/xoadoanhthutram/{id}")
	public String xoadoanhthutram(ModelMap model, @PathVariable int id) {
		/* DiemDuLich diemDuLich = searchDiemDuLich(id); */
		DoanhThuTram doanhThuTram = searchDoanhThuTram(id);

		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			/* session.delete(diemDuLich); */

			String hql = "delete from DoanhThuTram where id=:id";

			Query query1 = session.createQuery(hql);
			query1.setParameter("id", id);
			int result1 = query1.executeUpdate();

			t.commit();
			model.addAttribute("message", 1);
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", 2);

		} finally {
			session.close();
		}

		return "redirect:/doanhthutram/"+doanhThuTram.getDoanhThuNgay().getId()+".htm";
	}
	


	@RequestMapping("doanhthungay")
	public String doanhthungay(HttpServletRequest request, ModelMap model, @RequestParam(defaultValue = "0") int page) {

		return "nhapdoanhthu/doanhthungay";
	}

	@RequestMapping("xemdoanhthu")
	public String xemdoanhthu(HttpServletRequest request, ModelMap model, @RequestParam(defaultValue = "0") int page) {

		return "nhapdoanhthu/xemdoanhthu";
	}
	
	
	@RequestMapping("doanhthuchung")
	public String xemDoanhThu(ModelMap model, HttpSession ss, @RequestParam(defaultValue = "") String tungay,
			@RequestParam(defaultValue = "") String denngay) {
		 if (tungay.length() != 0 && denngay.length() != 0) {
		  model.addAttribute("thoigian", "Từ ngày " + tungay + " đến ngày " + denngay +
		  " :"); } else if (tungay.length() != 0) { model.addAttribute("thoigian",
		  "Sau ngày " + tungay + " :"); } else if (denngay.length() != 0) {
		  model.addAttribute("thoigian", "Trước ngày " + denngay + " :"); }
		  
		 long c_veHSSV_tg= countDoanhThu_HSSV("TG",tungay,denngay);
		 long c_veHSSV_ktg= countDoanhThu_HSSV("KTG",tungay,denngay);
		 long c_veBT_tg= countDoanhThu_BT("TG",tungay,denngay);
		 long c_veBT_ktg= countDoanhThu_BT("KTG",tungay,denngay);
		 long c_veTap_tg= countDoanhThu_Tap("TG",tungay,denngay);
		 long c_veTap_ktg= countDoanhThu_Tap("KTG",tungay,denngay);
		 
		 long s_veHSSV_tg= sumDoanhThu_HSSV("TG",tungay,denngay);
		 long s_veHSSV_ktg= sumDoanhThu_HSSV("KTG",tungay,denngay);
		 long s_veBT_tg= sumDoanhThu_BT("TG",tungay,denngay);
		 long s_veBT_ktg= sumDoanhThu_BT("KTG",tungay,denngay);
		 long s_vetap_tg= sumDoanhThu_Tap("TG",tungay,denngay);
		 long s_vetap_ktg= sumDoanhThu_Tap("KTG",tungay,denngay);
		
		  model.addAttribute("c_veHSSV_tg", c_veHSSV_tg);
		  model.addAttribute("c_veHSSV_ktg", c_veHSSV_ktg);
		  model.addAttribute("c_veHSSV_tong", c_veHSSV_tg+c_veHSSV_ktg);
		  model.addAttribute("c_veBT_tg", c_veBT_tg);
		  model.addAttribute("c_veBT_ktg", c_veBT_ktg);
		  model.addAttribute("c_veBT_tong", c_veBT_ktg+c_veBT_tg);
		  model.addAttribute("c_veTap_tg", c_veTap_tg);
		  model.addAttribute("c_veTap_ktg", c_veTap_ktg);
		  model.addAttribute("c_veTap_tong", c_veTap_ktg+c_veTap_tg);
		  
		  
		  model.addAttribute("s_veHSSV_tg", s_veHSSV_tg);
		  model.addAttribute("s_veHSSV_ktg", s_veHSSV_ktg);
		  model.addAttribute("s_veHSSV_tong", s_veHSSV_tg+s_veHSSV_ktg);
		  model.addAttribute("s_veBT_tg", s_veBT_tg);
		  model.addAttribute("s_veBT_ktg", s_veBT_ktg);
		  model.addAttribute("s_veBT_tong", s_veBT_tg+s_veBT_ktg);
		  model.addAttribute("s_vetap_tg", s_vetap_tg);
		  model.addAttribute("s_vetap_ktg", s_vetap_ktg);
		  model.addAttribute("s_vetap_tong", s_vetap_tg+s_vetap_ktg);
		 
		 
		
		  
		  
		return "doanhthu/doanhthuchung";}
	
	
	public long countDoanhThu_HSSV( String loaihinh, String tungay, String denngay) {
		Session session = factory.getCurrentSession();
		Query query = null;
		String hql1 = "";

		if (tungay.length() != 0 && denngay.length() != 0) {
			LocalDate localDate1 = LocalDate.parse(tungay, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			Date date1 = Date.from(localDate1.atStartOfDay(ZoneId.systemDefault()).toInstant());
			LocalDate localDate2 = LocalDate.parse(denngay, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			Date date2 = Date.from(localDate2.atStartOfDay(ZoneId.systemDefault()).toInstant());
			hql1 = "Select sum(soVeHSSV) FROM DoanhThuNgay  where ((tuyenDuong_dtn.giaVe.loaiHinh=:loaihinh) and ngay >= :date1) and ngay <= :date2";
			query = (Query) session.createQuery(hql1);
			query.setParameter("loaihinh", loaihinh);
			query.setParameter("date1", date1);
			query.setParameter("date2", date2);
		}

		else if (tungay.length() != 0) {
			LocalDate localDate1 = LocalDate.parse(tungay, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			Date date1 = Date.from(localDate1.atStartOfDay(ZoneId.systemDefault()).toInstant());
			hql1 = "Select sum(soVeHSSV) FROM DoanhThuNgay  where (tuyenDuong_dtn.giaVe.loaiHinh=:loaihinh) and ngay >= :date1 ";
			query = session.createQuery(hql1);
			query.setParameter("date1", date1);
			query.setParameter("loaihinh", loaihinh);
			
		}

		else if (denngay.length() != 0) {
			LocalDate localDate2 = LocalDate.parse(denngay, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			Date date2 = Date.from(localDate2.atStartOfDay(ZoneId.systemDefault()).toInstant());
			hql1 = "Select sum(soVeHSSV) FROM DoanhThuNgay  where (tuyenDuong_dtn.giaVe.loaiHinh=:loaihinh) and ngay <= :date2 ";
			query = session.createQuery(hql1);
			query.setParameter("date2", date2);
			
			query.setParameter("loaihinh", loaihinh);
		} else {
			hql1 = "Select sum(soVeHSSV) FROM DoanhThuNgay  where (tuyenDuong_dtn.giaVe.loaiHinh=:loaihinh)  ";
			query = session.createQuery(hql1);
			query.setParameter("loaihinh", loaihinh);
		}
		if (query.uniqueResult() == null)
			return 0;
		long total = (Long) query.uniqueResult();
		return total;
	}
	
	
	public long countDoanhThu_BT( String loaihinh, String tungay, String denngay) {
		Session session = factory.getCurrentSession();
		Query query = null;
		String hql1 = "";

		if (tungay.length() != 0 && denngay.length() != 0) {
			LocalDate localDate1 = LocalDate.parse(tungay, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			Date date1 = Date.from(localDate1.atStartOfDay(ZoneId.systemDefault()).toInstant());
			LocalDate localDate2 = LocalDate.parse(denngay, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			Date date2 = Date.from(localDate2.atStartOfDay(ZoneId.systemDefault()).toInstant());
			hql1 = "Select sum(soVeBT) FROM DoanhThuNgay  where ((tuyenDuong_dtn.giaVe.loaiHinh=:loaihinh) and ngay >= :date1) and ngay <= :date2";
			query = (Query) session.createQuery(hql1);
			query.setParameter("loaihinh", loaihinh);
			query.setParameter("date1", date1);
			query.setParameter("date2", date2);
		}

		else if (tungay.length() != 0) {
			LocalDate localDate1 = LocalDate.parse(tungay, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			Date date1 = Date.from(localDate1.atStartOfDay(ZoneId.systemDefault()).toInstant());
			hql1 = "Select sum(soVeBT) FROM DoanhThuNgay  where (tuyenDuong_dtn.giaVe.loaiHinh=:loaihinh) and ngay >= :date1 ";
			query = session.createQuery(hql1);
			query.setParameter("date1", date1);
			query.setParameter("loaihinh", loaihinh);
			
		}

		else if (denngay.length() != 0) {
			LocalDate localDate2 = LocalDate.parse(denngay, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			Date date2 = Date.from(localDate2.atStartOfDay(ZoneId.systemDefault()).toInstant());
			hql1 = "Select sum(soVeBT) FROM DoanhThuNgay  where (tuyenDuong_dtn.giaVe.loaiHinh=:loaihinh) and ngay <= :date2 ";
			query = session.createQuery(hql1);
			query.setParameter("date2", date2);
			
			query.setParameter("loaihinh", loaihinh);
		} else {
			hql1 = "Select sum(soVeBT) FROM DoanhThuNgay  where (tuyenDuong_dtn.giaVe.loaiHinh=:loaihinh)  ";
			query = session.createQuery(hql1);
			query.setParameter("loaihinh", loaihinh);
		}
		if (query.uniqueResult() == null)
			return 0;
		long total = (Long) query.uniqueResult();
		return total;
	}
	
	
	public long countDoanhThu_Tap( String loaihinh, String tungay, String denngay) {
		Session session = factory.getCurrentSession();
		Query query = null;
		String hql1 = "";

		if (tungay.length() != 0 && denngay.length() != 0) {
			LocalDate localDate1 = LocalDate.parse(tungay, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			Date date1 = Date.from(localDate1.atStartOfDay(ZoneId.systemDefault()).toInstant());
			LocalDate localDate2 = LocalDate.parse(denngay, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			Date date2 = Date.from(localDate2.atStartOfDay(ZoneId.systemDefault()).toInstant());
			hql1 = "Select sum(soVeTap) FROM DoanhThuTram  where ((doanhThuNgay.tuyenDuong_dtn.giaVe.loaiHinh=:loaihinh) and doanhThuNgay.ngay >= :date1) and doanhThuNgay.ngay <= :date2";
			query = (Query) session.createQuery(hql1);
			query.setParameter("loaihinh", loaihinh);
			query.setParameter("date1", date1);
			query.setParameter("date2", date2);
		}

		else if (tungay.length() != 0) {
			LocalDate localDate1 = LocalDate.parse(tungay, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			Date date1 = Date.from(localDate1.atStartOfDay(ZoneId.systemDefault()).toInstant());
			hql1 = "Select sum(soVeTap) FROM DoanhThuTram   where (doanhThuNgay.tuyenDuong_dtn.giaVe.loaiHinh=:loaihinh) and doanhThuNgay.ngay >= :date1 ";
			query = session.createQuery(hql1);
			query.setParameter("date1", date1);
			query.setParameter("loaihinh", loaihinh);
			
		}

		else if (denngay.length() != 0) {
			LocalDate localDate2 = LocalDate.parse(denngay, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			Date date2 = Date.from(localDate2.atStartOfDay(ZoneId.systemDefault()).toInstant());
			hql1 = "Select sum(soVeTap) FROM DoanhThuTram   where (doanhThuNgay.tuyenDuong_dtn.giaVe.loaiHinh=:loaihinh) and doanhThuNgay.ngay <= :date2 ";
			query = session.createQuery(hql1);
			query.setParameter("date2", date2);
			
			query.setParameter("loaihinh", loaihinh);
		} else {
			hql1 = "Select sum(soVeTap) FROM DoanhThuTram   where (doanhThuNgay.tuyenDuong_dtn.giaVe.loaiHinh=:loaihinh)  ";
			query = session.createQuery(hql1);
			query.setParameter("loaihinh", loaihinh);
		}
		if (query.uniqueResult() == null)
			return 0;
		long total = (Long) query.uniqueResult();
		return total;
	}
	
	
	public long sumDoanhThu_HSSV( String loaihinh, String tungay, String denngay) {
		Session session = factory.getCurrentSession();
		Query query = null;
		String hql1 = "";

		if (tungay.length() != 0 && denngay.length() != 0) {
			LocalDate localDate1 = LocalDate.parse(tungay, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			Date date1 = Date.from(localDate1.atStartOfDay(ZoneId.systemDefault()).toInstant());
			LocalDate localDate2 = LocalDate.parse(denngay, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			Date date2 = Date.from(localDate2.atStartOfDay(ZoneId.systemDefault()).toInstant());
			hql1 = "Select sum(soVeHSSV*tuyenDuong_dtn.giaVe.giaVeHSSV) FROM DoanhThuNgay  where ((tuyenDuong_dtn.giaVe.loaiHinh=:loaihinh) and ngay >= :date1) and ngay <= :date2";
			query = (Query) session.createQuery(hql1);
			query.setParameter("loaihinh", loaihinh);
			query.setParameter("date1", date1);
			query.setParameter("date2", date2);
		}

		else if (tungay.length() != 0) {
			LocalDate localDate1 = LocalDate.parse(tungay, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			Date date1 = Date.from(localDate1.atStartOfDay(ZoneId.systemDefault()).toInstant());
			hql1 = "Select sum(soVeHSSV*tuyenDuong_dtn.giaVe.giaVeHSSV) FROM DoanhThuNgay  where (tuyenDuong_dtn.giaVe.loaiHinh=:loaihinh) and ngay >= :date1 ";
			query = session.createQuery(hql1);
			query.setParameter("date1", date1);
			query.setParameter("loaihinh", loaihinh);
			
		}

		else if (denngay.length() != 0) {
			LocalDate localDate2 = LocalDate.parse(denngay, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			Date date2 = Date.from(localDate2.atStartOfDay(ZoneId.systemDefault()).toInstant());
			hql1 = "Select sum(soVeHSSV*tuyenDuong_dtn.giaVe.giaVeHSSV) FROM DoanhThuNgay  where (tuyenDuong_dtn.giaVe.loaiHinh=:loaihinh) and ngay <= :date2 ";
			query = session.createQuery(hql1);
			query.setParameter("date2", date2);
			
			query.setParameter("loaihinh", loaihinh);
		} else {
			hql1 = "Select sum(soVeHSSV*tuyenDuong_dtn.giaVe.giaVeHSSV) FROM DoanhThuNgay  where (tuyenDuong_dtn.giaVe.loaiHinh=:loaihinh)  ";
			query = session.createQuery(hql1);
			query.setParameter("loaihinh", loaihinh);
		}
		if (query.uniqueResult() == null)
			return 0;
		long total = (long) query.uniqueResult();
		return total;
	}

	
	public long sumDoanhThu_BT( String loaihinh, String tungay, String denngay) {
		Session session = factory.getCurrentSession();
		Query query = null;
		String hql1 = "";

		if (tungay.length() != 0 && denngay.length() != 0) {
			LocalDate localDate1 = LocalDate.parse(tungay, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			Date date1 = Date.from(localDate1.atStartOfDay(ZoneId.systemDefault()).toInstant());
			LocalDate localDate2 = LocalDate.parse(denngay, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			Date date2 = Date.from(localDate2.atStartOfDay(ZoneId.systemDefault()).toInstant());
			hql1 = "Select sum(soVeBT*tuyenDuong_dtn.giaVe.giaVeBT) FROM DoanhThuNgay  where ((tuyenDuong_dtn.giaVe.loaiHinh=:loaihinh) and ngay >= :date1) and ngay <= :date2";
			query = (Query) session.createQuery(hql1);
			query.setParameter("loaihinh", loaihinh);
			query.setParameter("date1", date1);
			query.setParameter("date2", date2);
		}

		else if (tungay.length() != 0) {
			LocalDate localDate1 = LocalDate.parse(tungay, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			Date date1 = Date.from(localDate1.atStartOfDay(ZoneId.systemDefault()).toInstant());
			hql1 = "Select sum(soVeBT*tuyenDuong_dtn.giaVe.giaVeBT) FROM DoanhThuNgay  where (tuyenDuong_dtn.giaVe.loaiHinh=:loaihinh) and ngay >= :date1 ";
			query = session.createQuery(hql1);
			query.setParameter("date1", date1);
			query.setParameter("loaihinh", loaihinh);
			
		}

		else if (denngay.length() != 0) {
			LocalDate localDate2 = LocalDate.parse(denngay, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			Date date2 = Date.from(localDate2.atStartOfDay(ZoneId.systemDefault()).toInstant());
			hql1 = "Select sum(soVeBT*tuyenDuong_dtn.giaVe.giaVeBT) FROM DoanhThuNgay  where (tuyenDuong_dtn.giaVe.loaiHinh=:loaihinh) and ngay <= :date2 ";
			query = session.createQuery(hql1);
			query.setParameter("date2", date2);
			
			query.setParameter("loaihinh", loaihinh);
		} else {
			hql1 = "Select sum(soVeBT*tuyenDuong_dtn.giaVe.giaVeBT) FROM DoanhThuNgay  where (tuyenDuong_dtn.giaVe.loaiHinh=:loaihinh)  ";
			query = session.createQuery(hql1);
			query.setParameter("loaihinh", loaihinh);
		}
		if (query.uniqueResult() == null)
			return 0;
		long total = (long) query.uniqueResult();
		return total;
	}
	
	
	public long sumDoanhThu_Tap( String loaihinh, String tungay, String denngay) {
		Session session = factory.getCurrentSession();
		Query query = null;
		String hql1 = "";

		if (tungay.length() != 0 && denngay.length() != 0) {
			LocalDate localDate1 = LocalDate.parse(tungay, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			Date date1 = Date.from(localDate1.atStartOfDay(ZoneId.systemDefault()).toInstant());
			LocalDate localDate2 = LocalDate.parse(denngay, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			Date date2 = Date.from(localDate2.atStartOfDay(ZoneId.systemDefault()).toInstant());
			hql1 = "Select sum(soVeTap*doanhThuNgay.tuyenDuong_dtn.giaVe.giaVeTap) FROM DoanhThuTram  where ((doanhThuNgay.tuyenDuong_dtn.giaVe.loaiHinh=:loaihinh) and doanhThuNgay.ngay >= :date1) and doanhThuNgay.ngay <= :date2";
			query = (Query) session.createQuery(hql1);
			query.setParameter("loaihinh", loaihinh);
			query.setParameter("date1", date1);
			query.setParameter("date2", date2);
		}

		else if (tungay.length() != 0) {
			LocalDate localDate1 = LocalDate.parse(tungay, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			Date date1 = Date.from(localDate1.atStartOfDay(ZoneId.systemDefault()).toInstant());
			hql1 = "Select sum(soVeTap*doanhThuNgay.tuyenDuong_dtn.giaVe.giaVeTap) FROM DoanhThuTram   where (doanhThuNgay.tuyenDuong_dtn.giaVe.loaiHinh=:loaihinh) and doanhThuNgay.ngay >= :date1 ";
			query = session.createQuery(hql1);
			query.setParameter("date1", date1);
			query.setParameter("loaihinh", loaihinh);
			
		}

		else if (denngay.length() != 0) {
			LocalDate localDate2 = LocalDate.parse(denngay, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			Date date2 = Date.from(localDate2.atStartOfDay(ZoneId.systemDefault()).toInstant());
			hql1 = "Select sum(soVeTap*doanhThuNgay.tuyenDuong_dtn.giaVe.giaVeTap) FROM DoanhThuTram   where (doanhThuNgay.tuyenDuong_dtn.giaVe.loaiHinh=:loaihinh) and doanhThuNgay.ngay <= :date2 ";
			query = session.createQuery(hql1);
			query.setParameter("date2", date2);
			
			query.setParameter("loaihinh", loaihinh);
		} else {
			hql1 = "Select sum(soVeTap*doanhThuNgay.tuyenDuong_dtn.giaVe.giaVeTap) FROM DoanhThuTram   where (doanhThuNgay.tuyenDuong_dtn.giaVe.loaiHinh=:loaihinh)  ";
			query = session.createQuery(hql1);
			query.setParameter("loaihinh", loaihinh);
		}
		if (query.uniqueResult() == null)
			return 0;
		long total = (Long) query.uniqueResult();
		return total;
	}
	

	public GiaVe searchGiave(int id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM GiaVe WHERE id = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		if (query.list().size() == 0)
			return null;
		return (GiaVe) query.list().get(0);
	}
	
	public DoanhThuTram searchDoanhThuTram(int id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM DoanhThuTram WHERE id = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		if (query.list().size() == 0)
			return null;
		return (DoanhThuTram) query.list().get(0);
	}
	
	public DoanhThuNgay searchDoanhThuNgay(int id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM DoanhThuNgay WHERE id = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		if (query.list().size() == 0)
			return null;
		return (DoanhThuNgay) query.list().get(0);
	}

	public TramVe searchTramVe(int id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM TramVe WHERE id = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		if (query.list().size() == 0)
			return null;
		return (TramVe) query.list().get(0);
	}

	public List<TuyenDuong> getTuyenDuongs() {
		Session session = factory.getCurrentSession();
		String hql = "FROM TuyenDuong";
		List<TuyenDuong> chucVus = session.createQuery(hql).list();
		return chucVus;
	}
	public List<TramVe> geTramVes(int idDTN) {
		Session session = factory.getCurrentSession();
		String hql = "FROM TramVe tv WHERE tv.id Not IN (SELECT dtt.tramVe.id FROM DoanhThuTram dtt where dtt.doanhThuNgay.id =:idDTN)";
		Query query = session.createQuery(hql);
		query.setParameter("idDTN", idDTN);
		List<TramVe> chucVus = query.list();
		return chucVus;
	}

	public List<TramVe> getTramVes() {
		Session session = factory.getCurrentSession();
		String hql = "FROM TramVe";
		List<TramVe> chucVus = session.createQuery(hql).list();
		return chucVus;
	}

	public List<GiaVe> getGiaVes() {
		Session session = factory.getCurrentSession();
		String hql = "FROM GiaVe";
		List<GiaVe> chucVus = session.createQuery(hql).list();
		return chucVus;
	}
	public int getSizeDoanhThuTram(int id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM DoanhThuTram where doanhThuNgay.id =:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		List<DoanhThuTram> list = query.list();

		return list.size();
	}
	public List<DoanhThuTram> geDoanhThuTrams(int page, int pageSize, int idDTN,String ten) {
		Session session = factory.getCurrentSession();
		String hql;
		Query query;
		List<DoanhThuTram> list;
		if (ten.length() == 0 )
		{
			hql ="FROM DoanhThuTram t where t.doanhThuNgay.id =:idDTN ORDER BY t.id ASC";
			query = session.createQuery(hql);
			query.setParameter("idDTN", idDTN);
			int offset = page * pageSize;
			list = query.setFirstResult(offset).setMaxResults(pageSize).list();
		} else
		{
			hql ="FROM DoanhThuTram t where t.tramVe.ten LIKE CONCAT( '%',:ten, '%') and  t.doanhThuNgay.id =:idDTN ORDER BY t.id ASC";
			query = session.createQuery(hql);
			int offset = page * pageSize;
			query.setParameter("idDTN", idDTN);
			query.setParameter("ten", ten);
			list = query.setFirstResult(offset).setMaxResults(pageSize).list();
		}
		return list;
	}
}
