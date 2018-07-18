package com.springmvcexample.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotEmpty;

@Entity
@Table(name="group_details")
public class Group {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="group_id")
	private int groupId;
	
	@NotEmpty(message="Group Name should not empty ")
	@Column(unique=true,name="group_name")
	private String groupName;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="created_date",updatable=false)
	private Date createdDate;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="updated_date")
	private Date updatedDate;
	
	@Column(name="status_flag",updatable=false)
	private boolean status;
	
	public int getGroupId() {
		return groupId;
	}

	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "Group [groupId=" + groupId + ", groupName=" + groupName + ", createdDate=" + createdDate
				+ ", updatedDate=" + updatedDate + ", status=" + status + "]";
	}
	
	

}
