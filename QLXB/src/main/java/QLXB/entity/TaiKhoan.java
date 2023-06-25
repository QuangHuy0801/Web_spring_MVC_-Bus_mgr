package QLXB.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.MapsId;
import javax.persistence.OneToOne;
import javax.persistence.Table;



@Entity
@Table(name="TAIKHOAN")
public class TaiKhoan {
	@Id
	@Column(name="MANV")
	private String maNV;
	
	@Column(name="PASSWORD")
	private  String PASSWORD;
	
	@Column(name="HOATDONG")
	private  int hoatDong;
	
	@OneToOne()
	@MapsId
	 @JoinColumn(name="MANV")
    private NhanVien nhanVien;

	public String getMaNV() {
		return maNV;
	}

	public void setMaNV(String maNV) {
		this.maNV = maNV;
	}

	public String getPASSWORD() {
		return PASSWORD;
	}

	public void setPASSWORD(String pASSWORD) {
		PASSWORD = pASSWORD;
	}

	public int getHoatDong() {
		return hoatDong;
	}

	public void setHoatDong(int hoatDong) {
		this.hoatDong = hoatDong;
	}

	public NhanVien getNhanVien() {
		return nhanVien;
	}

	public void setNhanVien(NhanVien nhanVien) {
		this.nhanVien = nhanVien;
	}
	
	
}
