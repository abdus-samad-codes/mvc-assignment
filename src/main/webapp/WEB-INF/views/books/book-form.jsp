<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<html>
<head>
    <title>Add Book</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/book-list.css">

    <style>
        .error-box {
            background: #fee2e2;
            color: #991b1b;
            padding: 14px 18px;
            border-radius: 10px;
            margin-bottom: 20px;
            border: 1px solid #fecaca;
        }

        .error-box strong {
            display: block;
            margin-bottom: 8px;
        }

        .error-box ul {
            margin: 0;
            padding-left: 20px;
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
    </div>
</div>

<div class="hero">
    <div class="tag">BOOK ENTRY</div>
    <h1>Add New Book</h1>
    <p>Enter complete details of a new book into the library system.</p>
</div>

<div class="main">
    <div class="content" style="width: 100%;">

        <div class="card" style="padding: 32px; max-width: 900px; margin: 0 auto;">

            <h2 style="margin-top: 0; color: #14532d;">Book Information</h2>

            <c:if test="${not empty error}">
                <div class="error-box">
                    ${error}
                </div>
            </c:if>

            <c:if test="${not empty errors}">
                <div class="error-box">
                    <strong>Please fix the following errors:</strong>
                    <ul>
                        <c:forEach var="err" items="${errors}">
                            <li>${err.value}</li>
                        </c:forEach>
                    </ul>
                </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/books/save" method="post">

                <label>Title</label>
                <input type="text"
                       name="title"
                       value="${book.title}"
                       placeholder="Enter book title"/>

                <label>ISBN</label>
                <input type="text"
                       name="isbn"
                       value="${book.isbn}"
                       placeholder="Enter ISBN number"/>

                <label>Publisher</label>
                <input type="text"
                       name="publisher"
                       value="${book.publisher}"
                       placeholder="Enter publisher name"/>

                <label>Publish Date</label>
                <input type="date"
                       name="publishDate"
                       value="${book.publishDate}"/>

                <label>Category</label>
                <select name="categoryId">
                    <option value="">Select category</option>
                    <c:forEach var="cat" items="${categories}">
                        <option value="${cat.id}"
                            <c:if test="${book.categoryId == cat.id}">selected</c:if>>
                            ${cat.name.value}
                        </option>
                    </c:forEach>
                </select>

                <label>Authors</label>
                <select name="authorIds" multiple>
                    <c:forEach var="author" items="${authors}">
                        <option value="${author.id}"
                            <c:if test="${book.authorIds != null && book.authorIds.contains(author.id)}">selected</c:if>>
                            ${author.firstName} ${author.lastName}
                        </option>
                    </c:forEach>
                </select>

                <label>Description</label>
                <textarea name="description"
                          placeholder="Enter book description">${book.description}</textarea>

                <label>Total Copies</label>
                <input type="number"
                       name="totalCopies"
                       value="${book.totalCopies}"
                       min="1"/>

                <label>Available Copies</label>
                <input type="number"
                       name="availableCopies"
                       value="${book.availableCopies}"
                       min="0"/>

                <label>Shelf Location</label>
                <input type="text"
                       name="shelfLocation"
                       value="${book.shelfLocation}"
                       placeholder="Example: A1-R2"/>

                <label>Pages</label>
                <input type="number"
                       name="pages"
                       value="${book.pages}"
                       min="1"/>

                <label>Book Image URL</label>
                <input type="text"
                       name="imageUrl"
                       value="${book.imageUrl}"
                       placeholder="Paste image URL"/>

                <button type="submit">Save Book</button>

            </form>

            <div class="back-link" style="margin-top: 18px;">
                <a class="edit-link" href="${pageContext.request.contextPath}/books/list">
                    ← Back to List
                </a>
            </div>

        </div>

    </div>
</div>

</body>
</html>