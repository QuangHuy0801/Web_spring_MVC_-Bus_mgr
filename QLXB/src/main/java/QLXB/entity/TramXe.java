package QLXB.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="TRAMXE")
public class TramXe {
	@Id
	@Column(name="MASO")
	private  String maSo;
	@Column(name="DIADIEM")
	private  String diaChi;
	@Column(name="TENTRAM")
	private  String ten;

	 @ManyToOne()
	  @JoinColumn(name="MANVTAO") private NhanVien nhanVienTaoTramXe;

	 @OneToMany(mappedBy = "tramXe", fetch = FetchType.EAGER) 
	  private List<CT_Tuyen_Duong> ct_Tuyen_Duongs;

	public String getMaSo() {
		return maSo;
	}

	public void setMaSo(String maSo) {
		this.maSo = maSo;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public String getTen() {
		return ten;
	}

	public void setTen(String ten) {
		this.ten = ten;
	}

	public NhanVien getNhanVienTaoTramXe() {
		return nhanVienTaoTramXe;
	}

	public void setNhanVienTaoTramXe(NhanVien nhanVienTaoTramXe) {
		this.nhanVienTaoTramXe = nhanVienTaoTramXe;
	}

	public List<CT_Tuyen_Duong> getCt_Tuyen_Duongs() {
		return ct_Tuyen_Duongs;
	}

	public void setCt_Tuyen_Duongs(List<CT_Tuyen_Duong> ct_Tuyen_Duongs) {
		this.ct_Tuyen_Duongs = ct_Tuyen_Duongs;
	}
	 
}
