<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html>
<head>
    <title>Add Author</title>
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
    <div class="tag">AUTHOR ENTRY</div>
    <h1>Add New Author</h1>
    <p>Register author details and link them with books in the library system.</p>
</div>

<div class="main">
    <div class="content" style="width: 100%;">

        <div class="card" style="padding: 32px; max-width: 850px; margin: 0 auto;">

            <h2 style="margin-top: 0; color: #14532d;">Author Information</h2>

            <c:if test="${not empty error}">
                <p class="field-error">${error}</p>
            </c:if>

            <form:form action="${pageContext.request.contextPath}/authors/save"
                       method="post"
                       modelAttribute="author">

                <label>First Name</label>
                <form:input path="firstName" placeholder="Enter first name"/>
                <form:errors path="firstName" cssClass="field-error"/>

                <label>Middle Name</label>
                <form:input path="middleName" placeholder="Enter middle name"/>
                <form:errors path="middleName" cssClass="field-error"/>

                <label>Last Name</label>
                <form:input path="lastName" placeholder="Enter last name"/>
                <form:errors path="lastName" cssClass="field-error"/>

                <label>Email</label>
                <form:input path="email" type="email" placeholder="Enter email address"/>
                <form:errors path="email" cssClass="field-error"/>

                <label>Phone</label>
                <form:input path="phone" placeholder="Enter 10 digit phone number"/>
                <form:errors path="phone" cssClass="field-error"/>

                <label>Date of Birth</label>
                <form:input path="dob" type="date"/>
                <form:errors path="dob" cssClass="field-error"/>

                <label>Author Image URL</label>
                <form:input path="imageUrl" placeholder="Paste image URL"/>
                <form:errors path="imageUrl" cssClass="field-error"/>

                <label>Biography</label>
                <form:textarea path="biography" placeholder="Write a short biography about the author"/>
                <form:errors path="biography" cssClass="field-error"/>

                <button type="submit">Save Author</button>

            </form:form>

            <div class="back-link" style="margin-top: 18px;">
                <a class="edit-link" href="${pageContext.request.contextPath}/authors/list">
                    ← Back to Author List
                </a>
            </div>

        </div>

    </div>
</div>

</body>
</html>