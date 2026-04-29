<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Library Management</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/book-list.css">
</head>
<body>

<!-- NAVBAR -->
<div class="navbar">
    <div class="logo">
        Library<span>Management</span>
    </div>
    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/books/list">Books</a>
        <a href="${pageContext.request.contextPath}/authors/list">Authors</a>
    </div>
</div>

<!-- HERO -->
<div class="hero">
    <div class="tag">WELCOME</div>
    <h1>Manage Your Library Easily</h1>
    <p>
        Browse, manage and explore books and authors in one place.
        Simple, fast and clean interface for your library system.
    </p>
</div>

<!-- MAIN -->
<div class="main">
    <div class="content">

        <div class="content-header">
            <h2>Dashboard</h2>
        </div>

        <div class="catalog">

            <!-- BOOK CARD -->
            <div class="card clickable-card"
                 onclick="window.location.href='${pageContext.request.contextPath}/books/list'">

                <div class="cover">📚</div>

                <div class="card-body">
                    <h3>Books</h3>
                    <div class="meta">Browse all books</div>
                    <div class="desc">
                        View, search, and manage all books in your library.
                    </div>
                    <div class="card-footer">
                        <a href="${pageContext.request.contextPath}/books/list" class="edit-link">Open →</a>
                    </div>
                </div>
            </div>

            <!-- AUTHOR CARD -->
            <div class="card clickable-card"
                 onclick="window.location.href='${pageContext.request.contextPath}/authors/list'">

                <div class="cover">👤</div>

                <div class="card-body">
                    <h3>Authors</h3>
                    <div class="meta">Manage authors</div>
                    <div class="desc">
                        Explore authors and their contributions to books.
                    </div>
                    <div class="card-footer">
                        <a href="${pageContext.request.contextPath}/authors/list" class="edit-link">Open →</a>
                    </div>
                </div>
            </div>

        </div>

    </div>
</div>

</body>
</html>