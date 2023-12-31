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
@Table(name="TRAMVE")
public class TramVe {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="ID")
	private  int id;
	@Column(name="DIADIEM")
	private  String diaChi;
	@Column(name="TENTRAMVE")
	private  String ten;

	 @ManyToOne()
	  @JoinColumn(name="MANVBV") 
	 private NhanVien nhanVienBanVe;

	 
	  @OneToMany(mappedBy = "tramVe", fetch = FetchType.EAGER) 
	  private List<DoanhThuTram> doanhThuTrams;

	

	public List<DoanhThuTram> getDoanhThuTrams() {
		return doanhThuTrams;
	}

	public void setDoanhThuTrams(List<DoanhThuTram> doanhThuTrams) {
		this.doanhThuTrams = doanhThuTrams;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public NhanVien getNhanVienBanVe() {
		return nhanVienBanVe;
	}

	public void setNhanVienBanVe(NhanVien nhanVienBanVe) {
		this.nhanVienBanVe = nhanVienBanVe;
	}
	 
	 

		/*
		 * @OneToMany(mappedBy = "nhanVienLaiXe", fetch = FetchType.EAGER) private
		 * List<Xe> laiXes;
		 */
	 
	 
}
