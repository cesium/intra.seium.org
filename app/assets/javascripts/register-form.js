$(document).ready(function(){
	var studInfo = {
		univStud: {
			div: document.getElementById('is-univ-student'),
			otherUnivDiv: document.getElementById('other-univ-info'),
			yesInput: document.getElementById('user_is_univ_student_true'),
			noInput: document.getElementById('user_is_univ_student_false')
		},
		minhoUnivStud: {
			div: document.getElementById('is-student-at-minho-univ'),
			studentIdDiv: document.getElementById('minho-univ-student-id'),
			yesInput: document.getElementById('user_is_student_at_minho_univ_true'),
			noInput: document.getElementById('user_is_student_at_minho_univ_false')
		},
		infEngStud: {
			div: document.getElementById('is-inf-eng-student-at-minho-univ'),
			yesInput: document.getElementById('user_is_inf_eng_student_at_minho_univ_true'),
			noInput: document.getElementById('user_is_inf_eng_student_at_minho_univ_false')
		},
		cesiumAssociate: {
			div: document.getElementById('is-cesium-associate'),
			assocNumberDiv: document.getElementById('cesium-associate-number'),
			yesInput: document.getElementById('user_is_cesium_associate_true'),
			noInput: document.getElementById('user_is_cesium_associate_false')
		}
	};

	function hideDiv(div) {
		div.hidden = true;
	}

	function showDiv(div) {
		div.hidden = false;
	}

	function check(checkBox) {
		checkBox.checked = true;
	}

	function uncheckBoth(obj) {
		obj.yesInput.checked = false;
		obj.noInput.checked = false;
	}

	function isUnivStudUpdate(studInfo) {
		uncheckBoth(studInfo.minhoUnivStud);
		hideDiv(studInfo.minhoUnivStud.studentIdDiv);
		hideDiv(studInfo.univStud.otherUnivDiv);
		showDiv(studInfo.minhoUnivStud.div);
	}

	function isNotUnivStudUpdate(studInfo) {
		hideDiv(studInfo.minhoUnivStud.div);
		isNotMinhoUnivStudUpdate(studInfo);
	}

	function isMinhoUnivStudUpdate(studInfo) {
		uncheckBoth(studInfo.infEngStud);
		hideDiv(studInfo.univStud.otherUnivDiv);
		showDiv(studInfo.minhoUnivStud.studentIdDiv);
		showDiv(studInfo.infEngStud.div);
	}

	function isNotMinhoUnivStudUpdate(studInfo) {
		check(studInfo.minhoUnivStud.noInput);
		isNotMinhoUnivInfEngStudUpdate(studInfo);
		hideDiv(studInfo.infEngStud.div);
		hideDiv(studInfo.minhoUnivStud.studentIdDiv);
		if(studInfo.univStud.yesInput.checked)
			showDiv(studInfo.univStud.otherUnivDiv);
	}

	function isMinhoUnivInfEngStudUpdate(studInfo) {
		uncheckBoth(studInfo.cesiumAssociate);
		showDiv(studInfo.cesiumAssociate.div);
	}

	function isNotMinhoUnivInfEngStudUpdate(studInfo) {
		check(studInfo.infEngStud.noInput);
		isNotCesiumAssociateUpdate(studInfo);
		hideDiv(studInfo.cesiumAssociate.div);
	}

	function isCesiumAssociateUpdate(studInfo) {
		showDiv(studInfo.cesiumAssociate.assocNumberDiv);
	}

	function isNotCesiumAssociateUpdate(studInfo) {
		check(studInfo.cesiumAssociate.noInput);
		hideDiv(studInfo.cesiumAssociate.assocNumberDiv);
	}

	function initialStudInfoConfiguration(studInfo) {
		check(studInfo.minhoUnivStud.noInput);
		check(studInfo.infEngStud.noInput);
		check(studInfo.cesiumAssociate.noInput);
		hideDiv(studInfo.univStud.otherUnivDiv);
		hideDiv(studInfo.minhoUnivStud.div);
		hideDiv(studInfo.infEngStud.div);
		hideDiv(studInfo.cesiumAssociate.div);
	}

	studInfo.univStud.yesInput.addEventListener("click", function(){ isUnivStudUpdate(studInfo) });
	studInfo.univStud.noInput.addEventListener("click", function(){ isNotUnivStudUpdate(studInfo); });
	studInfo.minhoUnivStud.yesInput.addEventListener("click", function(){ isMinhoUnivStudUpdate(studInfo); });
	studInfo.minhoUnivStud.noInput.addEventListener("click", function(){ isNotMinhoUnivStudUpdate(studInfo); });
	studInfo.infEngStud.yesInput.addEventListener("click", function(){ isMinhoUnivInfEngStudUpdate(studInfo); });
	studInfo.infEngStud.noInput.addEventListener("click", function(){ isNotMinhoUnivInfEngStudUpdate(studInfo); });
	studInfo.cesiumAssociate.yesInput.addEventListener("click", function(){ isCesiumAssociateUpdate(studInfo); });
	studInfo.cesiumAssociate.noInput.addEventListener("click", function(){ isNotCesiumAssociateUpdate(studInfo); });

	//initialStudInfoConfiguration(studInfo);
});
