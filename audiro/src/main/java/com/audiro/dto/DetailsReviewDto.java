package com.audiro.dto;

import java.sql.Clob;
import java.time.LocalDateTime;

import com.audiro.repository.Post;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DetailsReviewDto {
		
	private Integer postId;
	private Integer usersId;
	private String nickname;
	private String title;
	private String content;
	private Integer good;
	private Integer travelPlanId;
	private LocalDateTime modifiedTime;
	private Integer favoritePost;
	private Integer favoriteUserId;
	
	public static DetailsReviewDto fromEntity(Post post) {
		
		return DetailsReviewDto.builder().postId(post.getPostId())
				.usersId(post.getUsersId())
				.nickname(post.getNickname())
				.title(post.getTitle())
				.content(post.getContent())
				.good(post.getGood())
				.travelPlanId(post.getTravelPlanId())
				.modifiedTime(post.getModifiedTime())
				.favoriteUserId(post.getFavoriteUserId())
				.favoritePost(post.getFavoritePost())
				.build();
		
	}
}

