<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<html>
<head>
    <title>Book Details</title>
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
        <a href="${pageContext.request.contextPath}/books/join-view">Inner Join View</a>
    </div>
</div>

<div class="hero">
    <div class="tag">BOOK DETAILS</div>
    <h1>${book.title}</h1>
    <p>Full information about this library book.</p>
</div>

<div class="main">
    <div class="content" style="width: 100%;">

        <div class="card" style="display: flex; gap: 32px; padding: 30px;">

            <div class="cover" style="width: 230px; height: 310px; font-size: 65px; flex-shrink: 0;">
                <c:choose>
                    <c:when test="${not empty book.imageUrl}">
                        <img src="${book.imageUrl}" alt="${book.title}"
                             style="width:100%; height:100%; object-fit:cover;">
                    </c:when>
                    <c:when test="${not empty book.title}">
                        ${book.title.substring(0,1)}
                    </c:when>
                    <c:otherwise>B</c:otherwise>
                </c:choose>
            </div>

            <div class="card-body" style="flex: 1;">

                <h2 style="margin-top: 0;">${book.title}</h2>

                <div class="meta" style="font-size: 16px; line-height: 1.8;">
                    <strong>Category:</strong> ${book.categoryName}<br/>
                    <strong>Publisher:</strong> ${book.publisher}<br/>
                    <strong>ISBN:</strong> ${book.isbn}<br/>
                    <strong>Publish Date:</strong> ${book.publishDate}
                </div>

                <div class="desc" style="margin-top: 18px; line-height: 1.8;">
                    <strong>Language:</strong> ${book.language}<br/>
                    <strong>Pages:</strong> ${book.pages}<br/>
                    <strong>Shelf Location:</strong> ${book.shelfLocation}<br/>
                    <strong>Available Copies:</strong> ${book.availableCopies} / ${book.totalCopies}
                </div>

                <div style="margin-top: 16px;">
                    <c:choose>
                        <c:when test="${book.availableCopies > 0}">
                            <span class="badge">AVAILABLE</span>
                        </c:when>
                        <c:otherwise>
                            <span class="badge" style="background:#7f1d1d; color:#fecaca;">OUT OF STOCK</span>
                        </c:otherwise>
                    </c:choose>
                </div>

                <div class="authors" style="margin-top: 22px;">
                    <strong>Authors:</strong><br/>

                    <c:choose>
                        <c:when test="${empty book.authorNames}">
                            No authors linked.
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="authorName" items="${book.authorNames}" varStatus="status">
                                •
                                <a class="edit-link"
                                   href="${pageContext.request.contextPath}/authors/view/${book.authorIds[status.index]}">
                                    ${authorName}
                                </a>
                                <br/>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </div>

                <div style="margin-top: 28px;">
                    <h3 style="margin-bottom: 10px;">About this Book</h3>

                    <c:choose>
                        <c:when test="${not empty book.description}">
                            <p style="color: #cbd5e1; line-height: 1.7;">
                                ${book.description}
                            </p>
                        </c:when>
                        <c:otherwise>
                            <p style="color: #cbd5e1; line-height: 1.7;">
                                No description has been added for this book yet.
                            </p>
                        </c:otherwise>
                    </c:choose>
                </div>

                <div class="card-footer" style="margin-top: 30px;">
                    <a class="edit-link"
                       href="${pageContext.request.contextPath}/books/edit/${book.id}">
                        Edit Book
                    </a>

                    <a class="edit-link"
                       href="${pageContext.request.contextPath}/books/list">
                        ← Back to List
                    </a>
                </div>

            </div>
        </div>

    </div>
</div>

</body>
</html>