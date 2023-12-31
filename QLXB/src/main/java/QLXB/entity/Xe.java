package QLXB.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="XE")
public class Xe {
	@Id
	@Column(name="BIENSOXE")
	private  String bienSo;
	@Column(name="LOAIXE")
	private  String loaiXe;
	@Column(name="TINHTRANGXE")
	private  int tinhTrang;
	@Column(name="MOTAXE")
	private  String moTa;
	
	 @ManyToOne()
	  @JoinColumn(name="MANVLAIXE") private NhanVien nhanVienLaiXe;
	 @ManyToOne()
	  @JoinColumn(name="MANVPHUCVU") private NhanVien nhanVienPhuXe;
		
		  @ManyToOne()
		 @JoinColumn(name="IDTD") private TuyenDuong tuyenDuong_xe;
		 
	
	public TuyenDuong getTuyenDuong_xe() {
			return tuyenDuong_xe;
		}
		public void setTuyenDuong_xe(TuyenDuong tuyenDuong_xe) {
			this.tuyenDuong_xe = tuyenDuong_xe;
		}
	public String getLoaiXe() {
		return loaiXe;
	}
	public String getBienSo() {
		return bienSo;
	}
	public void setBienSo(String bienSo) {
		this.bienSo = bienSo;
	}
	public void setLoaiXe(String loaiXe) {
		this.loaiXe = loaiXe;
	}
	
	public int getTinhTrang() {
		return tinhTrang;
	}
	public void setTinhTrang(int tinhTrang) {
		this.tinhTrang = tinhTrang;
	}
	public String getMoTa() {
		return moTa;
	}
	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

	public NhanVien getNhanVienLaiXe() {
		return nhanVienLaiXe;
	}
	public void setNhanVienLaiXe(NhanVien nhanVienLaiXe) {
		this.nhanVienLaiXe = nhanVienLaiXe;
	}
	public NhanVien getNhanVienPhuXe() {
		return nhanVienPhuXe;
	}
	public void setNhanVienPhuXe(NhanVien nhanVienPhuXe) {
		this.nhanVienPhuXe = nhanVienPhuXe;
	}
	 

}
