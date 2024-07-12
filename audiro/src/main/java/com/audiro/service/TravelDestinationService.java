package com.audiro.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.audiro.repository.TravelDestination;
import com.audiro.repository.TravelDestinationDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class TravelDestinationService {

	private final TravelDestinationDao dao;

	public void saveAll(List<TravelDestination> data) {
//		log.debug("saveAll({})", data);
		for (TravelDestination d : data) {
			dao.saveAll(d);
		}
	}

	public List<TravelDestination> findAll() {
		return dao.findAll();
	}

}
