package com.nextit.member.vo;



import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.nextit.common.valid.ModifyType;
import com.nextit.common.valid.RegistType;


public class MemberVO  {
	@NotBlank(message = "memId 필수", groups = {RegistType.class})
	@Pattern(regexp="^[a-zA-Z0-9]{4,15}", message = "ID는 4자리이상 입력해주세요.")
	private String memId;                   /* 아이디       */
	@NotBlank(message = "memPass 필수", groups = {ModifyType.class,RegistType.class})
	@Pattern(regexp = "^[a-zA-Z0-9]{8,15}", message = "비밀번호는 알파벳,숫자 혼합 8자 이상 15자미만" , groups = {ModifyType.class,RegistType.class})
	private String memPass;                 /* 비밀번호     */
	@NotBlank(message = "memName 필수", groups = {ModifyType.class,RegistType.class})
	private String memName;                 /* 이름         */
	@NotBlank(message = "memZip 필수", groups = {ModifyType.class,RegistType.class})
	private String memZip;                  /* 우편번호     */
	@NotBlank(message = "memAddr1 필수", groups = {ModifyType.class,RegistType.class})
	private String memAddr1;                /* 주소1        */
	private String memAddr2;                /* 주소2        */
	@NotBlank(message = "memBir 필수", groups = {ModifyType.class,RegistType.class})
	private String memBir;                  /* 생년월일     */
	@NotBlank(message = "memHp 필수", groups = {ModifyType.class,RegistType.class})
	private String memHp;                   /* 전화번호     */
	private String memProfile;              /* 자기소개     */
	private String memPref;                 /* 선호 포지션  */
	private String memImageUrl;             /* 프로필사진   */
	@NotBlank(message = "memMail은 필수입니다.", groups = {ModifyType.class,RegistType.class})
	@Pattern(regexp= "^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i", message ="이메일 형식을 지켜주세요.")
	private String memMail;                 /* 메일주소     */
	private String memRegDate;              /* 가입일       */
	private String memDelYn;                /* 탈퇴여부     */
	private String memRole;                 /* 관리등급     */
	private String memTeamName;             /* 팀 이름      */
	private String memTeamRegDate;          /* 팀 가입일    */
	private String memBackNo;               /* 등 번호      */
	private String memTeamPref;             /* 포지션       */
	private String memTeamRole;             /* 팀 관리등급  */
	
	private String memPassConfirm; 
	
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}


	public String getMemId() {
		return memId;
	}


	public void setMemId(String memId) {
		this.memId = memId;
	}


	public String getMemPass() {
		return memPass;
	}


	public void setMemPass(String memPass) {
		this.memPass = memPass;
	}


	public String getMemName() {
		return memName;
	}


	public void setMemName(String memName) {
		this.memName = memName;
	}


	public String getMemZip() {
		return memZip;
	}


	public void setMemZip(String memZip) {
		this.memZip = memZip;
	}


	public String getMemAddr1() {
		return memAddr1;
	}


	public void setMemAddr1(String memAddr1) {
		this.memAddr1 = memAddr1;
	}


	public String getMemAddr2() {
		return memAddr2;
	}


	public void setMemAddr2(String memAddr2) {
		this.memAddr2 = memAddr2;
	}


	public String getMemBir() {
		return memBir;
	}


	public void setMemBir(String memBir) {
		this.memBir = memBir;
	}


	public String getMemHp() {
		return memHp;
	}


	public void setMemHp(String memHp) {
		this.memHp = memHp;
	}


	public String getMemProfile() {
		return memProfile;
	}


	public void setMemProfile(String memProfile) {
		this.memProfile = memProfile;
	}


	public String getMemPref() {
		return memPref;
	}


	public void setMemPref(String memPref) {
		this.memPref = memPref;
	}


	public String getMemImageUrl() {
		return memImageUrl;
	}


	public void setMemImageUrl(String memImageUrl) {
		this.memImageUrl = memImageUrl;
	}


	public String getMemMail() {
		return memMail;
	}


	public void setMemMail(String memMail) {
		this.memMail = memMail;
	}


	public String getMemRegDate() {
		return memRegDate;
	}


	public void setMemRegDate(String memRegDate) {
		this.memRegDate = memRegDate;
	}


	public String getMemDelYn() {
		return memDelYn;
	}


	public void setMemDelYn(String memDelYn) {
		this.memDelYn = memDelYn;
	}


	public String getMemRole() {
		return memRole;
	}


	public void setMemRole(String memRole) {
		this.memRole = memRole;
	}


	public String getMemTeamName() {
		return memTeamName;
	}


	public void setMemTeamName(String memTeamName) {
		this.memTeamName = memTeamName;
	}


	public String getMemTeamRegDate() {
		return memTeamRegDate;
	}


	public void setMemTeamRegDate(String memTeamRegDate) {
		this.memTeamRegDate = memTeamRegDate;
	}


	public String getMemBackNo() {
		return memBackNo;
	}


	public void setMemBackNo(String memBackNo) {
		this.memBackNo = memBackNo;
	}


	public String getMemTeamPref() {
		return memTeamPref;
	}


	public void setMemTeamPref(String memTeamPref) {
		this.memTeamPref = memTeamPref;
	}


	public String getMemTeamRole() {
		return memTeamRole;
	}


	public void setMemTeamRole(String memTeamRole) {
		this.memTeamRole = memTeamRole;
	}


	public String getMemPassConfirm() {
		return memPassConfirm;
	}


	public void setMemPassConfirm(String memPassConfirm) {
		this.memPassConfirm = memPassConfirm;
	}
	
	
}
