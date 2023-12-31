package QLXB.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;





@Entity
@Table(name="NHANVIEN")
public class NhanVien {
	@Id
	@Column(name="MANV")
	private  String maNV;
	@Column(name="HO")
	private  String ho;
	@Column(name="TEN")
	private  String ten;
	@Column(name="CCCD")
	private  String cCCD;
	@Column(name="GIOITINH")
	private  String gioiTinh;
	@Column(name = "NGAYSINH")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date ngaySinh;
	@Column(name="SODT")
	private  String sDT;
	@Column(name="DIACHI")
	private  String diaChi;
	@Column(name="EMAIL")
	private  String email;
	@Column(name="TRANGTHAI")
	private  int trangThai;
	
	@OneToOne(mappedBy = "nhanVien", fetch = FetchType.LAZY)
    private TaiKhoan taiKhoan;
	
	  @ManyToOne()
	  @JoinColumn(name="IDCV") private ChucVu chucVu;
	  
	  @OneToMany(mappedBy = "nhanVienLaiXe", fetch = FetchType.LAZY) 
	  private List<Xe> laiXes;
	  @OneToMany(mappedBy = "nhanVienPhuXe", fetch = FetchType.LAZY) 
	  private List<Xe> phuXes;
	  
	  @OneToMany(mappedBy = "nhanVienTaoTramXe", fetch = FetchType.LAZY) 
	  private List<TramXe> tramXes;
	  
	  @OneToMany(mappedBy = "nhanVienBanVe", fetch = FetchType.LAZY) 
	  private List<TramVe> banVes;
	  @OneToMany(mappedBy = "nhanVien_nhap", fetch = FetchType.LAZY) 
	  private List<DoanhThuNgay> doanhThuNgays;
	  
	  
	  
	  @OneToMany(mappedBy = "nhanVienTD", fetch = FetchType.LAZY) 
	  private List<TuyenDuong> tuyenDuongs;
	 

	public List<DoanhThuNgay> getDoanhThuNgays() {
		return doanhThuNgays;
	}

	public void setDoanhThuNgays(List<DoanhThuNgay> doanhThuNgays) {
		this.doanhThuNgays = doanhThuNgays;
	}

	public List<TuyenDuong> getTuyenDuongs() {
		return tuyenDuongs;
	}

	public void setTuyenDuongs(List<TuyenDuong> tuyenDuongs) {
		this.tuyenDuongs = tuyenDuongs;
	}

	public List<Xe> getLaiXes() {
		return laiXes;
	}

	public void setLaiXes(List<Xe> laiXes) {
		this.laiXes = laiXes;
	}

	public List<Xe> getPhuXes() {
		return phuXes;
	}

	public void setPhuXes(List<Xe> phuXes) {
		this.phuXes = phuXes;
	}

	public List<TramXe> getTramXes() {
		return tramXes;
	}

	public void setTramXes(List<TramXe> tramXes) {
		this.tramXes = tramXes;
	}

	

	public List<TramVe> getBanVes() {
		return banVes;
	}

	public void setBanVes(List<TramVe> banVes) {
		this.banVes = banVes;
	}

	public String getMaNV() {
		return maNV;
	}

	public void setMaNV(String maNV) {
		this.maNV = maNV;
	}

	public String getHo() {
		return ho;
	}

	public void setHo(String ho) {
		this.ho = ho;
	}

	public String getTen() {
		return ten;
	}

	public void setTen(String ten) {
		this.ten = ten;
	}

	public String getcCCD() {
		return cCCD;
	}

	public void setcCCD(String cCCD) {
		this.cCCD = cCCD;
	}

	public String getGioiTinh() {
		return gioiTinh;
	}

	public void setGioiTinh(String gioiTinh) {
		this.gioiTinh = gioiTinh;
	}

	public Date getNgaySinh() {
		return ngaySinh;
	}

	public void setNgaySinh(Date ngaySinh) {
		this.ngaySinh = ngaySinh;
	}

	public String getsDT() {
		return sDT;
	}

	public void setsDT(String sDT) {
		this.sDT = sDT;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getTrangThai() {
		return trangThai;
	}

	public void setTrangThai(int trangThai) {
		this.trangThai = trangThai;
	}

	public TaiKhoan getTaiKhoan() {
		return taiKhoan;
	}

	public void setTaiKhoan(TaiKhoan taiKhoan) {
		this.taiKhoan = taiKhoan;
	}

	public ChucVu getChucVu() {
		return chucVu;
	}

	public void setChucVu(ChucVu chucVu) {
		this.chucVu = chucVu;
	}


	
	  
}
