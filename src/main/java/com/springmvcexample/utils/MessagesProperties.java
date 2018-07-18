package com.springmvcexample.utils;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@ConfigurationProperties(prefix = "message")
@Component
public class MessagesProperties {

	private String saveSuccessMsg;
	private String saveErrorMsg;
	private String updateSuccessMsg;
	private String updateErrorMsg;
	private String deleteSuccessMsg;
	private String deleteErrorMsg;

	public String getSaveSuccessMsg() {
		return saveSuccessMsg;
	}

	public void setSaveSuccessMsg(String saveSuccessMsg) {
		this.saveSuccessMsg = saveSuccessMsg;
	}

	public String getSaveErrorMsg() {
		return saveErrorMsg;
	}

	public void setSaveErrorMsg(String saveErrorMsg) {
		this.saveErrorMsg = saveErrorMsg;
	}

	public String getUpdateSuccessMsg() {
		return updateSuccessMsg;
	}

	public void setUpdateSuccessMsg(String updateSuccessMsg) {
		this.updateSuccessMsg = updateSuccessMsg;
	}

	public String getUpdateErrorMsg() {
		return updateErrorMsg;
	}

	public void setUpdateErrorMsg(String updateErrorMsg) {
		this.updateErrorMsg = updateErrorMsg;
	}

	public String getDeleteSuccessMsg() {
		return deleteSuccessMsg;
	}

	public void setDeleteSuccessMsg(String deleteSuccessMsg) {
		this.deleteSuccessMsg = deleteSuccessMsg;
	}

	public String getDeleteErrorMsg() {
		return deleteErrorMsg;
	}

	public void setDeleteErrorMsg(String deleteErrorMsg) {
		this.deleteErrorMsg = deleteErrorMsg;
	}
}
