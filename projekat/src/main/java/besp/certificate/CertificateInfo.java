package besp.certificate;

public class CertificateInfo {
	private String path;
	private String pass;
	private static CertificateInfo ci = null;
	public String getPath() {
		return path;
	}
	public String getPass() {
		return pass;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	private CertificateInfo(String path, String pass) {
		this.path = path;
		this.pass = pass;
	}
	
	public static CertificateInfo getInstance(){
		if(ci == null){
			ci = new CertificateInfo("", "");
		}
		return ci;
	}
	
	
}
