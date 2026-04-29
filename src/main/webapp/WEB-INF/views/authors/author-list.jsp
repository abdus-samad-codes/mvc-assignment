<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<html>
<head>
    <title>Authors List</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/book-list.css">
</head>

<body>

<div class="navbar">
    <div class="logo">
        BOOKHUB <span>LIBRARY MANAGEMENT SYSTEM</span>
    </div>

    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/books/list">Discover</a>
        <a href="${pageContext.request.contextPath}/books/form">Add Book</a>
        <a href="${pageContext.request.contextPath}/authors/form">Add Author</a>
        <a href="${pageContext.request.contextPath}/authors/list">Authors</a>
    </div>
</div>

<div class="hero">
    <div class="tag">AUTHOR DIRECTORY</div>
    <h1>Library Authors</h1>
    <p>View and manage authors registered in the library system.</p>
</div>

<div class="main">
    <div class="content" style="width: 100%;">

        <div class="content-header">
            <h2>Authors Collection</h2>
            <div class="count">${authors.size()} authors available</div>
        </div>

        <c:choose>
            <c:when test="${empty authors}">
                <div class="empty">No authors available yet.</div>
            </c:when>

            <c:otherwise>
                <div class="catalog">

                    <c:forEach var="author" items="${authors}">
                        <div class="card clickable-card"
                             onclick="window.location.href='${pageContext.request.contextPath}/authors/view/${author.id}'">

                            <div class="cover">
                                <c:choose>
                                    <c:when test="${not empty author.imageUrl}">
                                        <img src="${author.imageUrl}" alt="Author Image"
                                             style="width:100%; height:100%; object-fit:cover;">
                                    </c:when>
                                    <c:otherwise>
                                        ${author.firstName.substring(0,1)}
                                    </c:otherwise>
                                </c:choose>
                            </div>

                            <div class="card-body">
                                <h3>
                                    ${author.firstName}
                                    <c:if test="${not empty author.middleName}">
                                        ${author.middleName}
                                    </c:if>
                                    ${author.lastName}
                                </h3>

                                <div class="desc">
                                    Email: ${author.email}<br/>
                                    Phone: ${author.phone}
                                </div>

                                <div class="card-footer">
                                    <span class="badge">AUTHOR</span>

                                    <a class="edit-link"
                                       href="${pageContext.request.contextPath}/authors/edit/${author.id}"
                                       onclick="event.stopPropagation();">
                                        Edit
                                    </a>
                                </div>
                            </div>

                        </div>
                    </c:forEach>

                </div>
            </c:otherwise>
        </c:choose>

        <div style="margin-top: 25px;">
            <a class="edit-link" href="${pageContext.request.contextPath}/authors/form">
                + Add New Author
            </a>
        </div>

    </div>
</div>

</body>
</html>