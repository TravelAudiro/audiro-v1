package com.audiro.dto;

import java.time.LocalDateTime;

import com.audiro.repository.Post;
import com.audiro.repository.User;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MyReviewListDto {
	
	private Integer postId;
	private Integer usersId;
	private String nickname;
	private String title;
	private LocalDateTime modifiedTime;
	private Integer favoritePost;
	private Integer favoriteUserId;
	
	public static MyReviewListDto fromEntity(Post post) {
		return MyReviewListDto.builder()
				.postId(post.getPostId())
				.usersId(post.getUsersId())
				.nickname(post.getNickname())
				.title(post.getTitle())
				.modifiedTime(post.getModifiedTime())
				.favoritePost(post.getFavoritePost())
				.favoriteUserId(post.getFavoriteUserId())
				.build();
	}
}
