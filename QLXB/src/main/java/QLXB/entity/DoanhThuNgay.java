package QLXB.entity;

import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="DOANHTHUNGAY")
public class DoanhThuNgay {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="ID")
	private  int id;
	
	@Column(name="SOVEHSSV")
	private  int soVeHSSV;
	
	@Column(name="SOVEBT")
	private  int soVeBT;
	
	@Column(name="NGAY")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private  Date ngay;
	
	@OneToMany(mappedBy = "doanhThuNgay", fetch = FetchType.LAZY) 
	  private List<DoanhThuTram> doanhThuTrams;
	
	@ManyToOne()
	  @JoinColumn(name="IDTD") 
	 private TuyenDuong tuyenDuong_dtn;
	
	@ManyToOne()
	  @JoinColumn(name="MANVNHAP") 
	 private NhanVien nhanVien_nhap;
	
	
	
	
	
	public TuyenDuong getTuyenDuong_dtn() {
		return tuyenDuong_dtn;
	}
	public void setTuyenDuong_dtn(TuyenDuong tuyenDuong_dtn) {
		this.tuyenDuong_dtn = tuyenDuong_dtn;
	}
	public NhanVien getNhanVien_nhap() {
		return nhanVien_nhap;
	}
	public void setNhanVien_nhap(NhanVien nhanVien_nhap) {
		this.nhanVien_nhap = nhanVien_nhap;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSoVeHSSV() {
		return soVeHSSV;
	}
	public void setSoVeHSSV(int soVeHSSV) {
		this.soVeHSSV = soVeHSSV;
	}
	public int getSoVeBT() {
		return soVeBT;
	}
	public void setSoVeBT(int soVeBT) {
		this.soVeBT = soVeBT;
	}
	public Date getNgay() {
		return ngay;
	}
	public void setNgay(Date ngay) {
		this.ngay = ngay;
	}
	public List<DoanhThuTram> getDoanhThuTrams() {
		return doanhThuTrams;
	}
	public void setDoanhThuTrams(List<DoanhThuTram> doanhThuTrams) {
		this.doanhThuTrams = doanhThuTrams;
	}
	

	
	
}
