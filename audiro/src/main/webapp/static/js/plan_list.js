/**
 * /audiro/plan_list.jsp에 포함
 */

document.addEventListener('DOMContentLoaded', () => {
	const deletePlanImg = document.querySelectorAll('img.deletePlanImg');
	deletePlanImg.forEach((d) => {
		d.removeEventListener('click', deletePlan); // 중복방지
		d.addEventListener('click', deletePlan);
	});


	function deletePlan(event) {
		const deleteModal = new bootstrap.Modal(document.querySelector('div.modal'), { backdrop: true })
		const btnConfirm = document.querySelector('#btnConfirm');
		deleteModal.show();
		
		btnConfirm.removeEventListener('click', confirmDeletePlan); // 기존 이벤트 리스너 제거
		btnConfirm.addEventListener('click', confirmDeletePlan); // 새로운 이벤트 리스너 추가
		const travelPlanId = event.target.closest('td.img').getAttribute('plan-id');

		function confirmDeletePlan() {
			const uri = `/audiro/api/plan/deleteCourse/${travelPlanId}`;
			axios
				.get(uri)
				.then((response) => {
					event.target.closest('tr').remove();
					courseElement.remove();
				})
				.catch((error) => {
					console.log(error);
				});
			deleteModal.hide();

		}


	}



})