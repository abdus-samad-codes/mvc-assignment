<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html>
<head>
    <title>Update Book</title>
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
    </div>
</div>

<div class="hero">
    <div class="tag">UPDATE BOOK</div>
    <h1>Edit Book Details</h1>
    <p>Modify existing book information in the system.</p>
</div>

<div class="main">
    <div class="content" style="width: 100%;">

        <div class="card" style="padding: 32px; max-width: 900px; margin: 0 auto;">

            <h2 style="margin-top: 0; color: #14532d;">Update Book</h2>

            <c:if test="${not empty error}">
                <p class="field-error">${error}</p>
            </c:if>

            <form:form action="${pageContext.request.contextPath}/books/update"
                       method="post"
                       modelAttribute="book">

                <form:hidden path="id"/>

                <label>Title</label>
                <form:input path="title" placeholder="Enter book title"/>
                <form:errors path="title" cssClass="field-error"/>

                <label>ISBN</label>
                <form:input path="isbn" placeholder="Enter ISBN number"/>
                <form:errors path="isbn" cssClass="field-error"/>

                <label>Publisher</label>
                <form:input path="publisher" placeholder="Enter publisher name"/>
                <form:errors path="publisher" cssClass="field-error"/>

                <label>Publish Date</label>
                <form:input path="publishDate" type="date"/>
                <form:errors path="publishDate" cssClass="field-error"/>

                <label>Category</label>
                <form:select path="categoryId">
                    <form:option value="">Select category</form:option>
                    <c:forEach var="cat" items="${categories}">
                        <form:option value="${cat.id}">
                            ${cat.name.value}
                        </form:option>
                    </c:forEach>
                </form:select>
                <form:errors path="categoryId" cssClass="field-error"/>

                <label>Authors</label>
                <form:select path="authorIds" multiple="true">
                    <c:forEach var="author" items="${authors}">
                        <form:option value="${author.id}">
                            ${author.firstName} ${author.lastName}
                        </form:option>
                    </c:forEach>
                </form:select>
                <form:errors path="authorIds" cssClass="field-error"/>

                <label>Description</label>
                <form:textarea path="description" placeholder="Enter book description"/>
                <form:errors path="description" cssClass="field-error"/>

                <label>Total Copies</label>
                <form:input path="totalCopies" type="number" min="1"/>
                <form:errors path="totalCopies" cssClass="field-error"/>

                <label>Available Copies</label>
                <form:input path="availableCopies" type="number" min="0"/>
                <form:errors path="availableCopies" cssClass="field-error"/>

                <label>Shelf Location</label>
                <form:input path="shelfLocation" placeholder="Example: A1-R2"/>
                <form:errors path="shelfLocation" cssClass="field-error"/>

                <label>Pages</label>
                <form:input path="pages" type="number" min="1"/>
                <form:errors path="pages" cssClass="field-error"/>

                <label>Book Image URL</label>
                <form:input path="imageUrl" placeholder="Paste image URL"/>
                <form:errors path="imageUrl" cssClass="field-error"/>

                <button type="submit">Update Book</button>

            </form:form>

            <div style="margin-top: 18px;">
                <a class="edit-link" href="${pageContext.request.contextPath}/books/list">
                    ← Back to List
                </a>
            </div>

        </div>

    </div>
</div>

</body>
</html>