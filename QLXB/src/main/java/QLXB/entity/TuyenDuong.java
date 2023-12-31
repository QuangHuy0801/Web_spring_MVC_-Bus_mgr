package QLXB.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="TUYENDUONG")
public class TuyenDuong {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="ID")
	private  int id;
	@Column(name = "TEN")
	private  String ten;
	@Column(name = "GIANCACH")
	private  String gianCach;
	@Column(name = "THOIGIANHD")
	private  String thoiGianHD;
	@Column(name = "THOIGIANCHUYEN")
	private  String thoiGianChuyen;
	@Column(name = "CULY")
	private  float cuLy;
	
	 @ManyToOne()
	  @JoinColumn(name="MANVTAO") 
	 private NhanVien nhanVienTD;
	 
	 @OneToMany(mappedBy = "tuyenDuong", fetch = FetchType.LAZY) 
	  private List<CT_Tuyen_Duong> ct_Tuyen_Duongs;
	  
	  
	  @OneToMany(mappedBy = "tuyenDuong_dtn", fetch = FetchType.LAZY) 
	  private List<DoanhThuNgay> doanhThuNgays;
	  @OneToMany(mappedBy = "tuyenDuong_xe", fetch = FetchType.LAZY) 
	  private List<Xe> xes;
	  
	  @ManyToOne()
	  @JoinColumn(name="IDGV") 
	 private GiaVe giaVe;
	  
	public List<DoanhThuNgay> getDoanhThuNgays() {
		return doanhThuNgays;
	}

	public void setDoanhThuNgays(List<DoanhThuNgay> doanhThuNgays) {
		this.doanhThuNgays = doanhThuNgays;
	}

	public List<Xe> getXes() {
		return xes;
	}

	public void setXes(List<Xe> xes) {
		this.xes = xes;
	}

	public GiaVe getGiaVe() {
		return giaVe;
	}

	public void setGiaVe(GiaVe giaVe) {
		this.giaVe = giaVe;
	}

	public List<CT_Tuyen_Duong> getCt_Tuyen_Duongs() {
		return ct_Tuyen_Duongs;
	}

	public void setCt_Tuyen_Duongs(List<CT_Tuyen_Duong> ct_Tuyen_Duongs) {
		this.ct_Tuyen_Duongs = ct_Tuyen_Duongs;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTen() {
		return ten;
	}

	public void setTen(String ten) {
		this.ten = ten;
	}

	public String getGianCach() {
		return gianCach;
	}

	public void setGianCach(String gianCach) {
		this.gianCach = gianCach;
	}

	public String getThoiGianHD() {
		return thoiGianHD;
	}

	public void setThoiGianHD(String thoiGianHD) {
		this.thoiGianHD = thoiGianHD;
	}

	public String getThoiGianChuyen() {
		return thoiGianChuyen;
	}

	public void setThoiGianChuyen(String thoiGianChuyen) {
		this.thoiGianChuyen = thoiGianChuyen;
	}



	public float getCuLy() {
		return cuLy;
	}

	public void setCuLy(float cuLy) {
		this.cuLy = cuLy;
	}

	public NhanVien getNhanVienTD() {
		return nhanVienTD;
	}

	public void setNhanVienTD(NhanVien nhanVienTD) {
		this.nhanVienTD = nhanVienTD;
	}
	 
	 
	

}
