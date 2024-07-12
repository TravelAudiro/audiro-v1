package com.audiro.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.audiro.dto.FavoriteDestinationDto;
import com.audiro.repository.FavoriteDestinationDao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class FavoriteDestinationService {

	private final FavoriteDestinationDao dao;

	public List<FavoriteDestinationDto> readAll() {
		List<FavoriteDestinationDto> list = dao.selectAllOrderById();
		return list;
	}
	
	public FavoriteDestinationDto readById(Integer favoriteDestinationId) {
		FavoriteDestinationDto dto=dao.selectById(favoriteDestinationId);
		return dto;
	}
}
