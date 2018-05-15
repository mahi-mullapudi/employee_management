<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mahidhar Mullapudi">
    <link rel="icon" href="images/favicon.ico">
    <title>Employee Management App Registration</title>
    <!-- Bootstrap core CSS -->
    <link href="css/external/bootstrap.min.css" rel="stylesheet">
    <!--Fonts-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i"
          rel="stylesheet">
    <!-- Icons -->
    <link href="css/external/font-awesome.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/login.css" rel="stylesheet">
</head>
<body>
<div class="container" id="wrapper">
    <main class="col-md-12">
        <section class="row">
            <div class="col-sm-12">
                <section class="row">
                    <div class="form-signin">
                        <br><img src="images/company_logo.jpg" class="img-fluid">
                        <hr>
                    </div>
                    <div class="col-md-12">
                        <h4 class="subheading">
                            Client Details
                        </h4>
                        <hr>
                        <c:if test="${not empty msg}">
                            <div class="col-md-12">
                                <div class="alert alert-${css} alert-dismissible" role="alert">
                                    <button type="button" class="close" data-dismiss="alert"
                                            aria-label="Close">
                                        <span aria-hidden="true">X</span>
                                    </button>
                                    <i class="fa fa-info-circle faa-flash animated"></i><strong> ${msg}</strong>
                                </div>
                            </div>
                        </c:if>

                        <spring:url value="/clientDetails" var="clientDetailsActionUrl"/>
                        <form:form method="POST" modelAttribute="clientDetails" action="${clientDetailsActionUrl}">

                            <form:hidden path="clientDetailsId"/>

                            <spring:bind path="clientName">
                                <div class="form-group col-md-6 ${status.error ? 'has-danger' : ''}">
                                    <label class="form-control-label" for="clientName">Client Name</label>
                                    <div class="inputGroupContainer">
                                        <form:input path="clientName" name="clientName"
                                                    maxlength="50"
                                                    placeholder="Client Name" data-toggle="tooltip"
                                                    data-animation="false"
                                                    class="form-control ${status.error ? 'form-control-danger' : ''}"
                                                    id="clientName"/>
                                        <div class="form-control-feedback">
                                            <form:errors path="clientName"/>
                                        </div>
                                    </div>
                                </div>
                            </spring:bind>

                            <spring:bind path="clientAddress">
                                <div class="form-group col-md-6 ${status.error ? 'has-danger' : ''}">
                                    <label class="form-control-label" for="clientAddress">Client Address</label>
                                    <div class="inputGroupContainer">
                                        <form:input path="clientAddress"
                                                    maxlength="100" name="clientAddress" id="clientAddress"
                                                    placeholder="Client Address" data-toggle="tooltip"
                                                    data-animation="false"
                                                    class="form-control ${status.error ? 'form-control-danger' : ''}"/>
                                        <div class="form-control-feedback">
                                            <form:errors path="clientAddress"/>
                                        </div>
                                    </div>
                                </div>
                            </spring:bind>

                            <spring:bind path="clientCity">
                                <div class="form-group col-md-6 ${status.error ? 'has-danger' : ''}">
                                    <label class="form-control-label" for="clientCity">City</label>
                                    <div class="inputGroupContainer">
                                        <form:input path="clientCity" maxlength="50" name="clientCity"
                                                    id="clientCity"
                                                    placeholder="Enter City" data-toggle="tooltip"
                                                    data-animation="false"
                                                    class="form-control ${status.error ? 'form-control-danger' : ''}"/>
                                        <div class="form-control-feedback">
                                            <form:errors
                                                    path="clientCity"/>
                                        </div>
                                    </div>
                                </div>
                            </spring:bind>

                            <spring:bind path="clientState">
                                <div class="form-group col-md-3">
                                    <label class="form-control-label" for="clientState">State</label>
                                    <div class="inputGroupContainer">
                                        <form:input
                                                path="clientState"
                                                name="clientState" id="clientState" maxlength="2"
                                                placeholder="Enter State"
                                                data-toggle="tooltip" data-animation="false"
                                                class="form-control ${status.error ? 'form-control-danger' : ''}"/>
                                        <div class="form-control-feedback">
                                            <form:errors path="clientState"/>
                                        </div>
                                    </div>
                                </div>
                            </spring:bind>

                            <spring:bind path="clientZip">
                                <div class="form-group col-md-3">
                                    <label class="form-control-label" for="clientZip">Zip</label>
                                    <div class="inputGroupContainer">
                                        <form:input path="clientZip"
                                                    name="clientZip" id="clientZip" maxlength="5"
                                                    placeholder="Enter Zip Code" data-toggle="tooltip"
                                                    data-animation="false"
                                                    class="form-control ${status.error ? 'form-control-danger' : ''}"/>
                                        <div class="form-control-feedback">
                                            <form:errors path="clientZip"/>
                                        </div>
                                    </div>
                                </div>
                            </spring:bind>

                            <spring:bind path="contractCompany">
                                <div class="form-group col-md-3">
                                    <label class="form-control-label" for="contractCompany">Contract Company</label>
                                    <div class="inputGroupContainer">
                                        <form:select path="contractCompany" id="contractCompany"
                                                     data-toggle="tooltip" data-animation="false"
                                                     class="form-control ${status.error ? 'form-control-danger' : ''}">

                                        </form:select>
                                        <div class="form-control-feedback">
                                            <form:errors path="contractCompany"/>
                                        </div>
                                    </div>
                                </div>
                            </spring:bind>

                            <spring:bind path="contractStartDate">
                                <div class="form-group col-md-3">
                                    <label class="form-control-label" for="contractStartDate">
                                        Contract Start Date
                                    </label>
                                    <div class="inputGroupContainer">
                                        <form:select path="contractStartDate" id="contractStartDate"
                                                     data-toggle="tooltip" data-animation="false"
                                                     class="form-control ${status.error ? 'form-control-danger' : ''}"/>
                                        <div class="form-control-feedback">
                                            <form:errors path="contractStartDate"/>
                                        </div>
                                    </div>
                                </div>
                            </spring:bind>

                            <spring:bind path="contractEndDate">
                                <div class="form-group col-md-3">
                                    <label class="form-control-label" for="contractEndDate">Contract End Date</label>
                                    <div class="inputGroupContainer">
                                        <form:select path="contractEndDate" id="contractEndDate"
                                                     data-toggle="tooltip" data-animation="false"
                                                     class="form-control ${status.error ? 'form-control-danger' : ''}"/>
                                        <div class="form-control-feedback">
                                            <form:errors path="contractEndDate"/>
                                        </div>
                                    </div>
                                </div>
                            </spring:bind>

                            <spring:bind path="vendorCompany">
                                <div class="form-group col-md-3">
                                    <label class="form-control-label" for="vendorCompany">Vendor Company</label>
                                    <div class="inputGroupContainer">
                                        <form:select path="vendorCompany" id="vendorCompany"
                                                     data-toggle="tooltip" data-animation="false"
                                                     class="form-control ${status.error ? 'form-control-danger' : ''}">
                                            <form:option value="" label=""/>
                                        </form:select>
                                        <div class="form-control-feedback">
                                            <form:errors path="vendorCompany"/>
                                        </div>
                                    </div>
                                </div>
                            </spring:bind>

                            <spring:bind path="vendorContactName">
                                <div class="form-group col-md-3">
                                    <label class="form-control-label" for="vendorContactName">
                                        Vendor Contact Name</label>
                                    <div class="inputGroupContainer">
                                        <form:input path="vendorContactName" id="vendorContactName"
                                                    data-toggle="tooltip" data-animation="false"
                                                    class="form-control ${status.error ? 'form-control-danger' : ''}"/>
                                        <div class="form-control-feedback">
                                            <form:errors path="vendorContactName"/>
                                        </div>
                                    </div>
                                </div>
                            </spring:bind>

                            <spring:bind path="vendorPhone">
                                <div class="form-group col-md-3">
                                    <label class="form-control-label" for="vendorPhone">Vendor Phone</label>
                                    <div class="inputGroupContainer">
                                        <form:input path="vendorPhone" id="contractEndDate"
                                                    data-toggle="tooltip" data-animation="false"
                                                    class="form-control ${status.error ? 'form-control-danger' : ''}"/>
                                        <div class="form-control-feedback">
                                            <form:errors path="vendorPhone"/>
                                        </div>
                                    </div>
                                </div>
                            </spring:bind>

                            <spring:bind path="vendorEmail">
                                <div class="form-group col-md-3">
                                    <label class="form-control-label" for="vendorEmail">Vendor Email</label>
                                    <div class="inputGroupContainer">
                                        <form:input path="vendorEmail" id="contractEndDate"
                                                    data-toggle="tooltip" data-animation="false"
                                                    class="form-control ${status.error ? 'form-control-danger' : ''}"/>
                                        <div class="form-control-feedback">
                                            <form:errors path="vendorEmail"/>
                                        </div>
                                    </div>
                                </div>
                            </spring:bind>

                            <spring:bind path="paymentTerms">
                                <div class="form-group col-md-3">
                                    <label class="form-control-label" for="paymentTerms">Payment Terms</label>
                                    <div class="inputGroupContainer">
                                        <form:select path="paymentTerms" id="paymentTerms"
                                                     data-toggle="tooltip" data-animation="false"
                                                     class="form-control ${status.error ? 'form-control-danger' : ''}">
                                            <form:option value="" label=""/>
                                        </form:select>
                                        <div class="form-control-feedback">
                                            <form:errors path="paymentTerms"/>
                                        </div>
                                    </div>
                                </div>
                            </spring:bind>

                            <spring:bind path="invoiceContactName">
                                <div class="form-group col-md-3">
                                    <label class="form-control-label" for="invoiceContactName">
                                        Invoice Contact Name
                                    </label>
                                    <div class="inputGroupContainer">
                                        <form:input path="invoiceContactName" id="invoiceContactName"
                                                    data-toggle="tooltip" data-animation="false"
                                                    class="form-control ${status.error ? 'form-control-danger' : ''}"/>
                                        <div class="form-control-feedback">
                                            <form:errors path="invoiceContactName"/>
                                        </div>
                                    </div>
                                </div>
                            </spring:bind>

                            <spring:bind path="invoiceContactPhone">
                                <div class="form-group col-md-3">
                                    <label class="form-control-label" for="invoiceContactPhone">
                                        Invoice Contact Phone
                                    </label>
                                    <div class="inputGroupContainer">
                                        <form:input path="invoiceContactPhone" id="invoiceContactPhone"
                                                    data-toggle="tooltip" data-animation="false"
                                                    class="form-control ${status.error ? 'form-control-danger' : ''}"/>
                                        <div class="form-control-feedback">
                                            <form:errors path="invoiceContactPhone"/>
                                        </div>
                                    </div>
                                </div>
                            </spring:bind>

                            <spring:bind path="invoiceContactEmail">
                                <div class="form-group col-md-3">
                                    <label class="form-control-label" for="vendorEmail">Invoice Contact Email</label>
                                    <div class="inputGroupContainer">
                                        <form:input path="invoiceContactEmail" id="invoiceContactEmail"
                                                    data-toggle="tooltip" data-animation="false"
                                                    class="form-control ${status.error ? 'form-control-danger' : ''}"/>
                                        <div class="form-control-feedback">
                                            <form:errors path="invoiceContactEmail"/>
                                        </div>
                                    </div>
                                </div>
                            </spring:bind>

                            <spring:bind path="invoiceFrequency">
                                <div class="form-group col-md-3">
                                    <label class="form-control-label" for="invoiceFrequency">Invoice Frequency</label>
                                    <div class="inputGroupContainer">
                                        <form:select path="invoiceFrequency" id="invoiceFrequency"
                                                     data-toggle="tooltip" data-animation="false"
                                                     class="form-control ${status.error ? 'form-control-danger' : ''}"/>
                                        <div class="form-control-feedback">
                                            <form:errors path="invoiceFrequency"/>
                                        </div>
                                    </div>
                                </div>
                            </spring:bind>

                            <spring:bind path="comments">
                                <div class="form-group col-md-12">
                                    <label class="form-control-label" for="comments">Comments</label>
                                    <div class="inputGroupContainer">
                                        <form:textarea path="comments" id="comments"
                                                       data-toggle="tooltip" data-animation="false"
                                                       class="form-control ${status.error ? 'form-control-danger' : ''}"/>
                                        <div class="form-control-feedback">
                                            <form:errors path="comments"/>
                                        </div>
                                    </div>
                                </div>
                            </spring:bind>

                        </form:form>
                        <hr>

                    </div>
                </section>
            </div>
        </section>
    </main>
</div>
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="js/external/jquery-3.2.1.min.js"></script>
<script src="js/external/tether.min.js"></script>
<script src="js/external/popper.min.js"></script>
<script src="js/external/bootstrap.min.js"></script>
<script src="js/external/jquery.mask.min.js"></script>

<script>
    $(function () {
        $('[data-toggle="tooltip"]').tooltip();
        $('.phone_us').mask('(000)000-0000');
    })
</script>
</body>
</html>