package spring.model.img;

import org.springframework.web.multipart.MultipartFile;

public class ImgDTO { 
  /** 번호 */ 
  private int imgno; 
  /** 글쓴이 */ 
  private String wname; 
  /** 제목 */ 
  private String title; 
  /** 내용 */ 
  private String content; 
  /** 패스워드 */ 
  private String passwd; 
   /** 그룹 번호 */ 
  private int grpno; 
  /** 답변 차수 */ 
  private int indent; 
  /** 답변 순서 */ 
  private int ansnum;
  /** 이미지파일 */ 
  private String filename;
  private MultipartFile filenameMF;
 
  
  
  private int pre_imgno1;
  private String pre_file1;
  private int pre_imgno2;
  private String pre_file2;
  private int nex_imgno1;
  private String nex_file1;
  private int nex_imgno2;
  private String nex_file2;
  
  
  public MultipartFile getFilenameMF() {
	return filenameMF;
}
public void setFilenameMF(MultipartFile filenameMF) {
	this.filenameMF = filenameMF;
}
public int getPre_imgno1() {
	return pre_imgno1;
}
public void setPre_imgno1(int pre_imgno1) {
	this.pre_imgno1 = pre_imgno1;
}
public String getPre_file1() {
	return pre_file1;
}
public void setPre_file1(String pre_file1) {
	this.pre_file1 = pre_file1;
}
public int getPre_imgno2() {
	return pre_imgno2;
}
public void setPre_imgno2(int pre_imgno2) {
	this.pre_imgno2 = pre_imgno2;
}
public String getPre_file2() {
	return pre_file2;
}
public void setPre_file2(String pre_file2) {
	this.pre_file2 = pre_file2;
}
public int getNex_imgno1() {
	return nex_imgno1;
}
public void setNex_imgno1(int nex_imgno1) {
	this.nex_imgno1 = nex_imgno1;
}
public String getNex_file1() {
	return nex_file1;
}
public void setNex_file1(String nex_file1) {
	this.nex_file1 = nex_file1;
}
public int getNex_imgno2() {
	return nex_imgno2;
}
public void setNex_imgno2(int nex_imgno2) {
	this.nex_imgno2 = nex_imgno2;
}
public String getNex_file2() {
	return nex_file2;
}
public void setNex_file2(String nex_file2) {
	this.nex_file2 = nex_file2;
}
public int getImgno() {
	return imgno;
}
public void setImgno(int imgno) {
	this.imgno = imgno;
}
public String getWname() {
	return wname;
}
public void setWname(String wname) {
	this.wname = wname;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public String getPasswd() {
	return passwd;
}
public void setPasswd(String passwd) {
	this.passwd = passwd;
}
public int getGrpno() {
	return grpno;
}
public void setGrpno(int grpno) {
	this.grpno = grpno;
}
public int getIndent() {
	return indent;
}
public void setIndent(int indent) {
	this.indent = indent;
}
public int getAnsnum() {
	return ansnum;
}
public void setAnsnum(int ansnum) {
	this.ansnum = ansnum;
}
public String getFilename() {
	return filename;
}
public void setFilename(String filename) {
	this.filename = filename;
}
}
  
  