package com.assignment02.uploadfile;

public class FileUploadResponse {
	private String fileName;
	private String downloadUri;
	private long size;
	/**
	 * @return the fileName
	 */
	public String getFileName() {
		return fileName;
	}
	/**
	 * @param fileName the fileName to set
	 */
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	/**
	 * @return the downloadUri
	 */
	public String getDownloadUri() {
		return downloadUri;
	}
	/**
	 * @param downloadUri the downloadUri to set
	 */
	public void setDownloadUri(String downloadUri) {
		this.downloadUri = downloadUri;
	}
	/**
	 * @return the size
	 */
	public long getSize() {
		return size;
	}
	/**
	 * @param size the size to set
	 */
	public void setSize(long size) {
		this.size = size;
	}
	@Override
	public String toString() {
		return "FileUploadResponse [fileName=" + fileName + ", downloadUri=" + downloadUri + ", size=" + size + "]";
	}
	
}
