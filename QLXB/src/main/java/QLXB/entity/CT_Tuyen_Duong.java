package QLXB.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="CT_TUYENDUONG")
public class CT_Tuyen_Duong {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="ID")
	private  int id;
	@Column(name="THUTU")
	private  int thuTu;
	
	@ManyToOne()
	  @JoinColumn(name="IDTD") 
	 private TuyenDuong tuyenDuong;

	@ManyToOne()
	  @JoinColumn(name="MATRAM") 
	 private TramXe tramXe;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getThuTu() {
		return thuTu;
	}

	public void setThuTu(int thuTu) {
		this.thuTu = thuTu;
	}

	public TuyenDuong getTuyenDuong() {
		return tuyenDuong;
	}

	public void setTuyenDuong(TuyenDuong tuyenDuong) {
		this.tuyenDuong = tuyenDuong;
	}

	public TramXe getTramXe() {
		return tramXe;
	}

	public void setTramXe(TramXe tramXe) {
		this.tramXe = tramXe;
	}
	
	

	
}
