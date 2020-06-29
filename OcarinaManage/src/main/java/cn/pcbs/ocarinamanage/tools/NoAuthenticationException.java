package cn.pcbs.ocarinamanage.tools;

public class NoAuthenticationException extends Exception{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public NoAuthenticationException() {}
	
	public NoAuthenticationException(String message) {
		super(message);
	}
}
