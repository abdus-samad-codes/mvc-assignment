<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>Update Author</title>
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
    <div class="tag">UPDATE AUTHOR</div>
    <h1>Edit Author Details</h1>
    <p>Update author information in the library system.</p>
</div>

<div class="main">
    <div class="content" style="width: 100%;">

        <div class="card" style="padding: 32px; max-width: 850px; margin: 0 auto;">

            <h2 style="margin-top: 0; color: #14532d;">Author Information</h2>

            <form action="${pageContext.request.contextPath}/authors/update" method="post">

                <input type="hidden" name="id" value="${author.id}"/>

                <label>First Name</label>
                <input type="text" name="firstName" value="${author.firstName}" required/>

                <label>Middle Name</label>
                <input type="text" name="middleName" value="${author.middleName}"/>

                <label>Last Name</label>
                <input type="text" name="lastName" value="${author.lastName}" required/>

                <label>Email</label>
                <input type="email" name="email" value="${author.email}" required/>

                <label>Phone</label>
                <input type="text" name="phone" value="${author.phone}"/>

                <label>Date of Birth</label>
                <input type="date" name="dob" value="${author.dob}"/>

                <label>Author Image URL</label>
                <input type="text" name="imageUrl" value="${author.imageUrl}"/>

                <label>Biography</label>
                <textarea name="biography">${author.biography}</textarea>

                <button type="submit">Update Author</button>

            </form>

            <div style="margin-top: 18px;">
                <a class="edit-link" href="${pageContext.request.contextPath}/authors/list">
                    ← Back to Author List
                </a>
            </div>

        </div>

    </div>
</div>

</body>
</html>