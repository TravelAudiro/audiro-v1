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
public class ListReviewDto {
	
	private Integer postId;
	private Integer usersId;
	private String nickname;
	private String title;
	private String content;
	private Integer good;
	private Integer travelPlanId;
	private LocalDateTime modifiedTime;
	private Integer favoritePost;
	
	public static ListReviewDto fromEntity(Post post) {
		
		return ListReviewDto.builder().postId(post.getPostId())
				.usersId(post.getUsersId())
				.nickname(post.getNickname())
				.title(post.getTitle())
				.content(post.getContent())
				.good(post.getGood())
				.travelPlanId(post.getTravelPlanId())
				.modifiedTime(post.getModifiedTime())
				.favoritePost(post.getFavoritePost())
				.build();
		
	}

}
