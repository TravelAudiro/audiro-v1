/**
 * 
 */

document.addEventListener('DOMContentLoaded', () => {

	function getDes() {
		const url = 'https://opensheet.elk.sh/1YORMfROHtoPOM0VR4-hLfGPfvG3hjLoItlVvdPPBAPQ/sheet';
		axios.get(url)
			.then(response => {
				const data = response.data;
				console.log(data);
				axios.post('./api/destination/save', data)
					.then((response) => {
						alert('Data saved successfully');
					})
					.catch((error) => {
						console.error('Error saving data', error);
					});
			})
			.catch(error => {
				console.error('Error fetching data', error);
			});

	}
	// 맨 처음 여행지 저장할 때만 사용
	//getDes();
});
