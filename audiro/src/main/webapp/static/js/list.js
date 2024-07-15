/**
 * post/review/list에 포함
 */

document.addEventListener('DOMContentLoaded', function() {

	/*if (signedInUser === null || signedInUser === '') {
		if (confirm("로그인하시겠습니까?")) {
			window.location.href = '/audiro/user/signin';
		}
		return;
	}*/
	
	//여행후기 찜 담기 클릭 이벤트
	const btnReviewLike = document.querySelectorAll('.likeReview');
	btnReviewLike.forEach(btn => {
		btn.addEventListener('click', favoriteReview);
	});
	
	
	//여행후기 찜담기(찜담고 삭제기능)
		async function favoriteReview(event) {
			alert('찜!!!!!!!!!!!!!!!');
			const tag = event.currentTarget;
			const postId = tag.attributes['data-review-id'].nodeValue; // 클릭된 버튼의 data-review-id 값 가져오기
			const id = document.querySelector('input#id');
			
			console.log('Post ID:', postId); // 디버깅을 위해 콘솔에 출력
			console.log('Users ID:', id); // 디버깅을 위해 콘솔에 출력
			
			try {
				const response = await axios.post('/audiro/api/review/likeReview/toggle', { postId });
				if (response.data) {
					tag.classList.add('active'); // 좋아요 추가된 경우 UI 업데이트
				} else if (!response.data) {
					tag.classList.remove('active'); // 좋아요 제거된 경우 UI 업데이트
				}
			} catch (error) {
				console.error('Error toggling favorite:', error);
			}
		}



	//정렬
	const rankForm = document.getElementById('rank');
	const selectElement = rankForm.querySelector('select');

	// select 요소 변경 시 이벤트 리스너 추가
	selectElement.addEventListener('change', function() {
		// 선택된 정렬 옵션 값 가져오기
		const selectedOption = selectElement.value;
		console.log('Selected option:', selectedOption);

		// FormData 객체를 사용하여 선택된 값을 전송
		const formData = new FormData();
		formData.append('sort', selectedOption);

		// Axios를 사용하여 서버로부터 데이터를 가져오기
		axios.get(`/audiro/api/review/list?sort=${selectedOption}`)
			.then(response => {
				const data = response.data;
				updateReviewList(data);
			})
			.catch(error => {
				console.error(error);
			});
	});


	// 리뷰 목록을 업데이트하는 함수
	function updateReviewList(data) {
		const reviewContainer = document.querySelector('.row.row-cols-1.row-cols-md-4.g-4'); // 리뷰 목록 컨테이너 요소
		reviewContainer.innerHTML = ''; // 기존 리뷰 목록 제거

		data.forEach(review => {
			const reviewCard = document.createElement('div');
			reviewCard.className = 'col';
			reviewCard.innerHTML = `
            <div class="card h-80">
                <div class="card-header" style="text-align: right">
                    <button class="btn like-btn" data-review-id="${review.postId}">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-suit-heart-fill" viewBox="0 0 16 16">
                            <path d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1" />
                        </svg>
                    </button>
                </div>
                <div>
                    <img src="${review.imageUrl}" class="card-img-top" alt="...">
                </div>
                <div class="card-body">
                    <h5 class="card-title">
                        <a href="details?postId=${review.postId}" class="card-link">${review.title}</a>
                    </h5>
                    <a href="#" class="list-group-item list-group-item-action">
                        <div class="d-flex w-100 justify-content-between">
                            <small>${review.modifiedTime}</small>
                        </div>
                    </a>
                </div>
            </div>
        `;
			reviewContainer.appendChild(reviewCard);
		});
	}












});