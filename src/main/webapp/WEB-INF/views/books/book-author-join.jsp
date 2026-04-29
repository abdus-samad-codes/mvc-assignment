<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<html>
<head>
    <title>Book Author View</title>
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
        <a href="${pageContext.request.contextPath}/books/join-view">Join View</a>
    </div>
</div>

<div class="hero">
    <div class="tag">JOIN VIEW</div>
    <h1>Books & Authors</h1>
    <p>Combined view showing books along with their authors.</p>
</div>

<div class="main">
    <div class="content" style="width: 100%;">

        <div class="card" style="padding: 30px;">

            <h2 style="color:#14532d;">Book Author Table</h2>

            <c:choose>
                <c:when test="${empty books}">
                    <div class="empty">No data available.</div>
                </c:when>

                <c:otherwise>

                    <table style="width:100%; border-collapse: collapse; margin-top: 20px;">

                        <thead>
                        <tr style="background:#dcfce7;">
                            <th style="padding:12px; border:1px solid #d1fae5;">Book Title</th>
                            <th style="padding:12px; border:1px solid #d1fae5;">ISBN</th>
                            <th style="padding:12px; border:1px solid #d1fae5;">Category</th>
                            <th style="padding:12px; border:1px solid #d1fae5;">Authors</th>
                        </tr>
                        </thead>

                        <tbody>

                        <c:forEach var="book" items="${books}">
                            <tr style="text-align:center;">

                                <td style="padding:10px; border:1px solid #e5e7eb;">
                                    ${book.title}
                                </td>

                                <td style="padding:10px; border:1px solid #e5e7eb;">
                                    ${book.isbn}
                                </td>

                                <td style="padding:10px; border:1px solid #e5e7eb;">
                                    ${book.categoryName}
                                </td>

                                <td style="padding:10px; border:1px solid #e5e7eb; text-align:left;">
                                    <c:forEach var="authorName" items="${book.authorNames}">
                                        • ${authorName}<br/>
                                    </c:forEach>
                                </td>

                            </tr>
                        </c:forEach>

                        </tbody>

                    </table>

                </c:otherwise>
            </c:choose>

            <div style="margin-top: 20px;">
                <a class="edit-link" href="${pageContext.request.contextPath}/books/list">
                    ← Back to Book List
                </a>
            </div>

        </div>

    </div>
</div>

</body>
</html>