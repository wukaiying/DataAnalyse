package bean;

public class Weibo {
	private int pk_id;
	private String fk_weiboId;
	private String userId;
	private String keyWord;
	private String content;
	private int commentNum;
	private int forwardNum;
	private String createAt;
	private String collectAt;
	public int getPk_id() {
		return pk_id;
	}
	public void setPk_id(int pk_id) {
		this.pk_id = pk_id;
	}
	public String getFk_weiboId() {
		return fk_weiboId;
	}
	public void setFk_weiboId(String fk_weiboId) {
		this.fk_weiboId = fk_weiboId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getKeyWord() {
		return keyWord;
	}
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getCommentNum() {
		return commentNum;
	}
	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}
	public int getForwardNum() {
		return forwardNum;
	}
	public void setForwardNum(int forwardNum) {
		this.forwardNum = forwardNum;
	}
	public String getCreateAt() {
		return createAt;
	}
	public void setCreateAt(String createAt) {
		this.createAt = createAt;
	}
	public String getCollectAt() {
		return collectAt;
	}
	public void setCollectAt(String collectAt) {
		this.collectAt = collectAt;
	}
	
	
}
