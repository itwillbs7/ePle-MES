package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.MAPDVO;
import com.itwillbs.persistence.ProductDAO;

@Service
public class ProductService {

	@Inject
	private ProductDAO productDAO;

	public void insertProduct(ProductDAO productDAO) {
		System.out.println("ProductService insertProduct()");
		productDAO.insertProduct(productDAO);
	}// insertProduct

	public List<ProductDAO> getProductList(PageDTO pageDTO) {
		System.out.println("ProductService getProductList()");
		// 10개씩 가져올 때 현 페이지에 대한 시작하는 행번호 구하기
		int startRow = (pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		// 끝나는 행번호 구하기
		int endRow = startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow-1);
		pageDTO.setEndRow(endRow);			
		return productDAO.getProductList(pageDTO);
	}// getProductList

	public void deleteProduct(ProductDAO productDAO) {
		System.out.println("ProductService deleteProduct()");
		productDAO.deleteProduct(productDAO);
	}// deleteProduct

	public ProductDAO getProduct(String productCode) {
		System.out.println("ProductService getProduct()");
		return productDAO.getProduct(productCode);
	}// getProduct

	public void updateProduct(ProductDAO productDAO) {
		System.out.println("ProductService updateProduct()");
		productDAO.updateProduct(productDAO);
	}// updateProduct

	public int getProductCount(PageDTO pageDTO) {
		System.out.println("ProductService getProductCount()");
		return productDAO.getProductCount(pageDTO);
	}



	
}