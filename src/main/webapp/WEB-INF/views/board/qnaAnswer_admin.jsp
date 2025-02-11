<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- ServletContext를 사용하여 업로드 경로를 가져옴 --%>
<%
    request.setCharacterEncoding("UTF-8");
    ServletContext context = request.getServletContext();
    String uploadPath = context.getRealPath("/images");
%>
<!DOCTYPE html>
<html>
<style>
    #image_preview {
        max-width: 100px; /* 이미지의 최대 너비를 100px로 설정 */
        max-height: 100px; /* 이미지의 최대 높이를 100px로 설정 */
    }
</style>
<head>
    <title>MakUSwag</title>
<script type="text/javascript">
    function insertqna() {
        // 제목, 내용, 카테고리 입력 필드를 가져옴
        var title = document.getElementById('subject');
        var content = document.getElementById('content');
        var category = document.getElementById('board_category');
        
        // 제목, 내용, 카테고리가 비어 있는지 확인
        if (title.value.trim() === '' && content.value.trim() === '' && category.value.trim() === '') {
            alert('빈칸이 있습니다');
            
            // 필드가 비어 있을 때 포커스 설정
            if (title.value.trim() === '') {
                title.focus();
            } else if (content.value.trim() === '') {
                content.focus();
            } else if (category.value.trim() === '') {
                category.focus();
            }
            
            event.preventDefault();
            return false;
        }
        
        // 모든 필드가 채워져 있으면 제출
        document.insertqnaForm.submit();
        return true;
    }
</script>
    <!-- CSS -->
    <link rel="stylesheet"
          href="//img.echosting.cafe24.com/editors/froala/3.2.2/css/froala_editor.pkgd.min.css?vs=2402071282">
    <link rel="stylesheet"
          href="//img.echosting.cafe24.com/editors/froala/css/themes/ec_froala.css?vs=2402071282">
    <link rel="stylesheet" href="./css/notice.css">
    <link rel="stylesheet" href="./css/style1.css">
    <link rel="icon" href="./images/CompanyLogo.png">
    <!-- 인터넷 창 아이콘에 로고 나오게 하기 -->
    <!-- JavaScript -->
    <script type="text/javascript"
            src="//img.echosting.cafe24.com/editors/froala/js/polyfill.min.js?vs=2402071282"></script>
    <script type="text/javascript"
            src="//img.echosting.cafe24.com/editors/froala/3.2.2/js/froala_editor.pkgd.min.js?vs=2402071282"></script>
    <script type="text/javascript"
            src="//img.echosting.cafe24.com/editors/froala/js/i18n/ko_KR.js?vs=2402071282"></script>

    <script>
        if (FroalaEditor.PLUGINS
            && FroalaEditor.PLUGINS.url)
            delete FroalaEditor.PLUGINS.url; // ECHOSTING-518735
    </script>
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body class="nav-expended">
<div class="sidebar-wrapper">
    <%@ include file="../include/sidebar.jsp" %>
</div>
<%@ include file="../admin/ProductInserthead.jsp" %>
<!-- ============================== [[ Body section]] ==============================-->
<div class="site-main">
    <div class="container">
        <!-- ============================== [[ Sidebar section]] ==============================-->
        <!-- ============================== [[ Body section]] ==============================-->
        <div class="main">
            <!-- 여기서부터 작성 -->
            <div class="xans-element- xans-board xans-board-writepackage board ">
                <div class="xans-element- xans-board xans-board-title board-header ">
                    <h3>
                        <font color="#555555">Q&A</font>
                    </h3>
                </div>
                <form id="boardWriteForm" name="insertqnaForm" action="qnaAnswersubmit"
                      method="post" target="_self" enctype="multipart/form-data">
                       <input type="hidden" name="qnaSeq" value="${contentView.qnaSeq}">
                    <input id="board_no" name="board_no" value="5" type="hidden"/>
                    <input id="product_no" name="product_no" value="0" type="hidden"/>
                    <input id="move_write_after" name="move_write_after"
                           value="/board/free/list.html?board_no=5" type="hidden"/>
                    <input id="cate_no" name="cate_no" value="" type="hidden"/>
                    <input id="bUsePassword" name="bUsePassword" value="" type="hidden"/>
                    <input id="order_id" name="order_id" value="" type="hidden"/>
                    <input id="is_post_checked" name="is_post_checked" value=""
                           type="hidden"/>
                    <input id="isExceptBoardUseFroalaImg"
                           name="isExceptBoardUseFroalaImg" value="" type="hidden"/>
                    <input id="isGalleryBoard" name="isGalleryBoard" value=""
                           type="hidden"/>
                    <input id="a5de8f588ce99" name="a5de8f588ce99"
                           value="90c5c2c59257572aaad9896dc0760aa1" type="hidden"/>
                    <div class="xans-element- xans-board xans-board-write post-editor ">
                        <div class="form-group">
                            <div class="form-row">
                                <div class="form-block">
                                    <div class="form-field subject">
                                        <div class="field-label">제목</div>
									<select id="board_category" name="qnaCategory">
    							                <option value="답변">답변</option>
                                        </select><input id="subject" name="qnaTitle"
                                                         class="inputTypeText"
                                                         placeholder="제목을 입력하세요" maxLength="125"
                                                         type="text" />
                                        <div class="checkbox"></div>
                                        <div class="checkbox"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-block">
                                    <div class="form-field post-textarea">
                                        <div class="field-label">내용</div>
                                        <!-- HTML -->
                                          <textarea style="width: 100%;" name="qnaContent" id="content"
                                                  class="ec-fr-never-be-duplicated"></textarea>
                                                  
                                        <input type="hidden" id="content_hidden"
                                               fw-filter="isSimplexEditorFill" fw-label="내용"
                                               value="EC_FROALA_INSTANCE"/>
                                        <!-- Run Froala Script -->
                                        <script type="text/javascript" src="./js/write.js"></script>
                                    </div>
                                    <div class="field-labdksl el"></div>
                                    <input name="qnaImage" id="qnaImage" type="file" onchange="previewImage()">
                                    <img id="image_preview" src="" alt="" style="display: none;">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-action">
                        <input type="button" class="button primary-button" value="SUBMIT"
                               name="qnaInsert" onclick="insertqna()">
                    </div>
                </form>
            </div>
            <!-- 여기까지 Swag~ -->
            <!-- ============================== [[ Body section]] ==============================-->
            <!-- =============================  [[ Footer section ]]  ============================= -->
        </div>
    </div>
</div>
<!-- =============================  [[ Footer section ]]  ============================= -->

<script>
// 파일 입력 필드의 변경(파일 선택) 이벤트 핸들러
function previewImage() {
    var input = document.getElementById('qnaImage');
    var preview = document.getElementById('image_preview');

    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            preview.style.display = 'block'; // 이미지 미리보기 보이기
            preview.src = e.target.result;
        };

        reader.readAsDataURL(input.files[0]);
    } else {
        preview.style.display = 'none'; // 이미지 미리보기 숨기기
        preview.src = ""; // 이미지 초기화
    }
}
</script>
</body>
</html>
