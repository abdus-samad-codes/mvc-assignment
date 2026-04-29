<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<html>
<head>
    <title>Error</title>
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
        <a href="${pageContext.request.contextPath}/authors/list">Authors</a>
    </div>
</div>

<div class="hero">
    <div class="tag">ERROR</div>
    <h1>Something went wrong</h1>
    <p>We couldn’t process your request. Please try again.</p>
</div>

<div class="main">
    <div class="content" style="width: 100%;">

        <div class="card" style="max-width: 600px; margin: 0 auto; padding: 40px; text-align: center;">

            <div style="font-size: 70px; margin-bottom: 15px;">
                ⚠️
            </div>

            <h2 style="color:#14532d; margin-bottom: 10px;">
                Oops! Something went wrong
            </h2>

            <p style="color:#4b5563; margin-bottom: 20px;">
                <c:choose>
                    <c:when test="${not empty error}">
                        ${error}
                    </c:when>
                    <c:otherwise>
                        An unexpected error occurred. Please try again later.
                    </c:otherwise>
                </c:choose>
            </p>

            <div style="display: flex; justify-content: center; gap: 15px; flex-wrap: wrap;">

                <a class="edit-link"
                   href="${pageContext.request.contextPath}/books/list"
                   style="padding:10px 18px; background:#22c55e; color:white; border-radius:8px;">
                    Go to Book List
                </a>

                <a class="edit-link"
                   href="${pageContext.request.contextPath}/authors/list"
                   style="padding:10px 18px; border:1px solid #22c55e; border-radius:8px;">
                    View Authors
                </a>

                <a class="edit-link"
                   href="javascript:history.back()"
                   style="padding:10px 18px; border:1px solid #94a3b8; border-radius:8px;">
                    Go Back
                </a>

            </div>

        </div>

    </div>
</div>

</body>
</html>