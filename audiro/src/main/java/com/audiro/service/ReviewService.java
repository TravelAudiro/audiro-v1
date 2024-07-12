package com.audiro.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;


import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.audiro.dto.CreateReviewDto;
import com.audiro.dto.LikeReviewPostDto;
import com.audiro.dto.LikeUserFavoriteDto;
import com.audiro.dto.ListReviewDto;
import com.audiro.dto.MyReviewListDto;
import com.audiro.dto.SerachReviewDto;
import com.audiro.repository.DraftPost;
import com.audiro.repository.FavoriteUsers;
import com.audiro.repository.Post;
import com.audiro.repository.ReviewDao;
import com.audiro.repository.User;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor // final 필드들을 초기화하는 아규먼트를 갖는 생성자.
public class ReviewService {

	private final ReviewDao reviewDao;

	// 여행후기 게시판 최신순,좋아요순 정렬
	public List<Post> getReviewsSortedBy(String sort) {
		List<Post> reviews = null;
		// 데이터베이스 또는 기타 저장소에서 리뷰 목록을 가져오는 로직 구현
		if ("likes".equals(sort)) {
			// 좋아요 순으로 정렬된 리뷰 목록 반환
			reviews = reviewDao.rankingGoodReview();
		} else if ("latest".equals(sort)) {
			// 최신 순으로 정렬된 리뷰 목록 반환
		}
		reviews = reviewDao.selectReviewAll();
		// 기본 정렬
		return reviews = reviewDao.selectReviewAll();
	}

	// 내 여행일기 리스트 불러오기
	public List<MyReviewListDto> myReviewList(MyReviewListDto dto) {
		List<MyReviewListDto> list = reviewDao.readMyReview(dto.getUsersId());
		log.debug("myReviewList={}", list);
		return list;

	}
	//프로필 이미지 가져오기
	public String img(Integer usersId) {
		String profileimg = reviewDao.profileImg(usersId);
		return profileimg;
	}

	// 나를 찜한 유저 수
	public int countLike(Integer userId) {

		int result = reviewDao.countLike(userId);
		return result;
	}

	// 내 여행일기 갯수
	public int countMyReveiw(Integer userId) {
		int result = reviewDao.countMyReveiw(userId);
		return result;
	}
	
	//여행후기 찜 수
	public int countFavorite(Integer postId) {
		int result = reviewDao.countFavoriteReveiw(postId);
		return result;
	}
	
	//여행후기 굿 수
	public int countGood(Integer postId) {
		int result = reviewDao.countGoodByPostId(postId);
		return result;
	}
	

	// 여행후기 많이작성한 유저 TOP3
	public List<Post> selectUserTop3() {
		List<Post> list = reviewDao.selectReviewUserTop3();
		return list;
	}

	// 여행후기 찜 담기// 
	public int LikeReview(LikeReviewPostDto dto) {
		int list = reviewDao.addLikeReview(dto);
		return list;
	}
	
	  //여행후기 찜 삭제 
	public int deleteLikeReview(LikeReviewPostDto dto) { 
		int list = reviewDao.deleteLikeReview(dto); 
		return list; 
		}
	 

	///////////////////////////////////////////////////////
	// 내 여행후기게시판 상세보기
	public Post readById(@RequestParam(name="postId") Integer postId, 
						 @RequestParam(name="usersId") Integer usersId) {
		Post list = reviewDao.readDetailsReviewById(postId);
		
        // 날짜 포맷팅을 위한 패턴 설정
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

        // LocalDateTime 객체를 포맷팅된 문자열로 변환
        String formattedModifiedTime = list.getModifiedTime().format(formatter);

        // 변환된 문자열을 설정
        list.setFormattedModifiedTime(formattedModifiedTime);
     
		return list;
	}

	// 여행후기 게시글 저장
	public int create(CreateReviewDto dto) {
		int result = reviewDao.insertReview(dto.toEntity());

		return result;
	}

	// 여행후기 게시글 임시저장
	public int createDraft(DraftPost draftPost) {
		log.debug("draftPost={}", draftPost);
		int result = reviewDao.saveDraftPost(draftPost);

		return result;
	}

	// 여행후기 게시글 수정
	public int update(CreateReviewDto dto) {
		int result = reviewDao.updateReview(dto);

		return result;

	}

	// 여행후기 삭제
	public int delete(Integer postId) {
		int result = reviewDao.deleteReview(postId);
		return result;
	}

	// 여행후기 모두 불러오기(최신순)
	public List<ListReviewDto> readAll() {
		List<Post> list = reviewDao.selectReviewAll();
		return list.stream().map(ListReviewDto::fromEntity).toList();
	}

	// 여행후기 검색
	public List<ListReviewDto> search(SerachReviewDto dto) {
		log.debug("dto={}", dto);
		List<Post> list = reviewDao.searchKeyword(dto);
		return list.stream().map(ListReviewDto::fromEntity).toList();
	}

	
	// 여행후기 담아있지는 확인.
	public boolean toggleFavorite(LikeReviewPostDto dto) {
		// 여행후기 찜 담아있는 내용 불러오기.
		
		List<LikeReviewPostDto> favoritePostIds = reviewDao.getFavoritePostIds(dto);

		// 현재 유저가 찜한 게시물인지 확인
		if (favoritePostIds.size() > 0) {
			// 이미 찜한 경우 제거
			favoritePostIds.stream().forEach(ids->{
				reviewDao.deleteLikeReview(ids);
			});
			return false;
		} else {
			// 찜하지 않은 경우
			reviewDao.addLikeReview(dto);
			return true;
		}
	}
	
	
	// 관심유저 담아있지는 확인.
	public boolean togglUserFavorite(LikeUserFavoriteDto dto) {
		// 여행후기 찜 담아있는 내용 불러오기.
		List<LikeUserFavoriteDto> favoriteUserIds = reviewDao.getFavoriteUserIds(dto);

		// 현재 유저가 관심유저 담았는지 확인
		if (favoriteUserIds.size() > 0) {
			// 이미 찜한 경우 제거
			favoriteUserIds.stream().forEach(ids->{
				reviewDao.deleteLikeUser(ids);
			});
			return false;
		} else {
			// 찜하지 않은 경우
			reviewDao.addLikeUser(dto);
			return true;
		}
	}
	
	

	// 여행후기 임시저장 불러오기
	public List<DraftPost> draftList() {
		List<DraftPost> list = reviewDao.selectDraftList();
		return list;
	}

	// 여행후기 임시저장 1개 상세보기
	public DraftPost draftPost(Integer draftPostId) {

		DraftPost draftPost = reviewDao.selectDrafById(draftPostId);
		return draftPost;

	}

}
