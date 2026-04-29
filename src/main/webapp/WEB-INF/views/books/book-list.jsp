<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<html>
<head>
    <title>Book Catalog</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/book-list.css">
    <style>
    .cover {
        overflow: hidden;
    }

    .cover img {
        display: block;
        width: 100%;
        height: 100%;
        object-fit: cover;
    }
    </style>
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
        <a href="${pageContext.request.contextPath}/books/join-view">Inner Join View</a>
    </div>
</div>

<div class="hero">
    <div class="tag">BOOK CATALOG EXPERIENCE</div>
    <h1>Discover Your Next Favorite Book</h1>
    <p>Manage books, authors, and categories in one simple awesome application.</p>
</div>

<div class="main">

<form class="filters" action="${pageContext.request.contextPath}/books/list" method="get">
    <h3>Discover Filters</h3>

    <input type="text"
           name="title"
           placeholder="Search books by title"
           value="${param.title}">

    <select name="authorId">
        <option value="">All Authors</option>
        <c:forEach var="author" items="${authors}">
            <option value="${author.id}"
                ${param.authorId == author.id.toString() ? 'selected' : ''}>
                ${author.firstName} ${author.lastName}
            </option>
        </c:forEach>
    </select>

    <select name="categoryId">
        <option value="">All Categories</option>
        <c:forEach var="category" items="${categories}">
            <option value="${category.id}"
                ${param.categoryId == category.id.toString() ? 'selected' : ''}>
                ${category.name.value}
            </option>
        </c:forEach>
    </select>

    <button type="submit">Apply Filters</button>

    <a class="edit-link" href="${pageContext.request.contextPath}/books/list">
        Clear Filters
    </a>
</form>

    <div class="content">

        <div class="content-header">
            <h2>Featured Catalog</h2>
            <div class="count">${books.size()} books available</div>
        </div>

        <c:choose>
            <c:when test="${empty books}">
                <div class="empty">No books available yet.</div>
            </c:when>

            <c:otherwise>
                <div class="catalog">

                    <c:forEach var="book" items="${books}">
                        <div class="card clickable-card"
                             onclick="window.location.href='${pageContext.request.contextPath}/books/view/${book.id}'">

                        <div class="cover">
                            <c:choose>
                                <c:when test="${not empty book.imageUrl}">
                                    <img src="${book.imageUrl}"
                                         alt="${book.title}"
                                         style="width:100%; height:100%; object-fit:cover;">
                                </c:when>

                                <c:when test="${not empty book.title}">
                                    ${book.title.substring(0,1)}
                                </c:when>

                                <c:otherwise>
                                    B
                                </c:otherwise>
                            </c:choose>
                        </div>

                            <div class="card-body">
                                <h3>${book.title}</h3>

                                <div class="meta">
                                    ${book.categoryName} | ${book.publisher}
                                </div>

                                <div class="desc">
                                    ISBN: ${book.isbn}<br/>
                                    Publish Date: ${book.publishDate}
                                </div>

                                <div class="authors">
                                    <strong>Authors:</strong><br/>
                                    <c:forEach var="authorName" items="${book.authorNames}">
                                        ${authorName}<br/>
                                    </c:forEach>
                                </div>

                                <div class="card-footer">
                                   <c:choose>
                                       <c:when test="${book.availableCopies > 0}">
                                           <span class="badge">AVAILABLE</span>
                                       </c:when>
                                       <c:otherwise>
                                           <span class="badge" style="background:#fee2e2; color:#991b1b;">
                                               OUT OF STOCK
                                           </span>
                                       </c:otherwise>
                                   </c:choose>

                                    <!-- prevent click conflict -->
                                    <a class="edit-link"
                                       href="${pageContext.request.contextPath}/books/edit/${book.id}"
                                       onclick="event.stopPropagation();">
                                        Edit Details
                                    </a>
                                </div>
                            </div>

                        </div>
                    </c:forEach>

                </div>
            </c:otherwise>
        </c:choose>

    </div>
</div>

</body>
</html>