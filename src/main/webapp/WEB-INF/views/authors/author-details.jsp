<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<html>
<head>
    <title>Author Details</title>
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
    <div class="tag">AUTHOR PROFILE</div>
    <h1>
        ${author.firstName}
        <c:if test="${not empty author.middleName}">
            ${author.middleName}
        </c:if>
        ${author.lastName}
    </h1>
    <p>View author information and books written by this author.</p>
</div>

<div class="main">

    <div class="content" style="width: 100%;">

        <div class="card" style="display: flex; gap: 30px; padding: 28px; margin-bottom: 30px;">

            <div style="width: 220px; height: 260px; border-radius: 18px; overflow: hidden; background: linear-gradient(135deg, #1e3a8a, #0e7490); display: flex; align-items: center; justify-content: center; font-size: 60px; font-weight: bold; color: #e0f2fe; flex-shrink: 0;">
                <c:choose>
                    <c:when test="${not empty author.imageUrl}">
                        <img src="${author.imageUrl}" alt="Author Image" style="width: 100%; height: 100%; object-fit: cover;">
                    </c:when>
                    <c:otherwise>
                        ${author.firstName.substring(0,1)}
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="card-body" style="flex: 1;">

                <h2 style="margin-top: 0;">
                    ${author.firstName}
                    <c:if test="${not empty author.middleName}">
                        ${author.middleName}
                    </c:if>
                    ${author.lastName}
                </h2>

                <div class="meta" style="font-size: 16px; line-height: 1.8;">
                    <strong>Email:</strong> ${author.email}<br/>
                    <strong>Phone:</strong> ${author.phone}<br/>
                    <strong>Date of Birth:</strong> ${author.dob}<br/>
                </div>

                <div style="margin-top: 24px;">
                    <h3 style="margin-bottom: 10px;">Biography</h3>

                    <c:choose>
                        <c:when test="${not empty author.biography}">
                            <p style="color: #51555A; line-height: 1.7;">
                                ${author.biography}
                            </p>
                        </c:when>
                        <c:otherwise>
                            <p style="color: #51555A; line-height: 1.7;">
                                No biography has been added for this author yet.
                            </p>
                        </c:otherwise>
                    </c:choose>
                </div>

                <div class="card-footer" style="margin-top: 25px;">
                    <a class="edit-link" href="${pageContext.request.contextPath}/authors/edit/${author.id}">
                        Edit Author
                    </a>

                    <a class="edit-link" href="${pageContext.request.contextPath}/books/list">
                        ← Back to Books
                    </a>
                </div>

            </div>

        </div>

        <div class="content-header">
            <h2>Books Written</h2>
            <div class="count">${books.size()} books found</div>
        </div>

        <c:choose>
            <c:when test="${empty books}">
                <div class="empty">No books are linked with this author yet.</div>
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
                                    Publish Date: ${book.publishDate}<br/>
                                    Shelf: ${book.shelfLocation}<br/>
                                    Available: ${book.availableCopies} / ${book.totalCopies}
                                </div>

                                <div class="card-footer">
                                    <span class="badge">LIBRARY BOOK</span>

                                    <a class="edit-link"
                                       href="${pageContext.request.contextPath}/books/edit/${book.id}"
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

    </div>

</div>

</body>
</html>