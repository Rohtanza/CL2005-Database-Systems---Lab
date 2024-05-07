<?php
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['form_submitted'])) {
    $host = 'localhost';
    $db = 'nutec';
    $user = 'root';
    $pass = ''; 
    $charset = 'utf8mb4';

    $dsn = "mysql:host=$host;dbname=$db;charset=$charset";
    $options = [
        PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES   => false,
    ];

    try {
        $pdo = new PDO($dsn, $user, $pass, $options);

        $stmt = $pdo->prepare('INSERT INTO users (firstname, lastname) VALUES (:firstname, :lastname)');
        $stmt->execute([
            'firstname' => $_POST['firstname'],
            'lastname' => $_POST['lastname'],
        ]);

        echo "<h2>Thank You " . htmlspecialchars($_POST['firstname']) . "!</h2>";
        echo "<p>You have been registered as " . htmlspecialchars($_POST['firstname']) . " " . htmlspecialchars($_POST['lastname']) . ".</p>";
        echo "<p>Go <a href='registration_form.php'>back</a> to the form</p>";
    } catch (\PDOException $e) {
        throw new \PDOException($e->getMessage(), (int)$e->getCode());
    }
} else {
    ?>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Registration Form</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins&display=swap">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
        <style>
            * {
                margin: 0;
                padding: 0;
                font-family: 'Poppins', sans-serif;
            }
            body {
                display: flex;
                height: 100vh;
                text-align: center;
                align-items: center;
                justify-content: center;
                background: #151515;
            }
            .login-form {
                position: relative;
                width: 370px;
                height: auto;
                background: #1b1b1b;
                padding: 40px 35px 60px;
                box-sizing: border-box;
                border: 1px solid black;
                border-radius: 5px;
                box-shadow: inset 0 0 1px #272727;
            }
            .text {
                font-size: 30px;
                color: #c7c7c7;
                font-weight: 600;
                letter-spacing: 2px;
            }
            form {
                margin-top: 40px;
            }
            form .field {
                margin-top: 20px;
                display: flex;
            }
            .field .fas {
                height: 50px;
                width: 60px;
                color: #868686;
                font-size: 20px;
                line-height: 50px;
                border: 1px solid #444;
                border-right: none;
                border-radius: 5px 0 0 5px;
                background: linear-gradient(#333, #222);
            }
            .field input, form button {
                height: 50px;
                width: 100%;
                outline: none;
                font-size: 19px;
                color: #868686;
                padding: 0 15px;
                border-radius: 0 5px 5px 0;
                border: 1px solid #444;
                caret-color: #339933;
                background: linear-gradient(#333, #222);
            }
            input:focus {
                color: #339933;
                box-shadow: 0 0 5px rgba(0, 255, 0, .2),
                inset 0 0 5px rgba(0, 255, 0, .1);
                background: linear-gradient(#333933, #222922);
                animation: glow .8s ease-out infinite alternate;
            }
            @keyframes glow {
                0% {
                    border-color: #339933;
                    box-shadow: 0 0 5px rgba(0, 255, 0, .2),
                    inset 0 0 5px rgba(0, 0, 0, .1);
                }
                100% {
                    border-color: #6f6;
                    box-shadow: 0 0 20px rgba(0, 255, 0, .6),
                    inset 0 0 10px rgba(0, 255, 0, .4);
                }
            }
            button {
                margin-top: 30px;
                border-radius: 5px!important;
                font-weight: 600;
                letter-spacing: 1px;
                cursor: pointer;
            }
            button:hover {
                color: #339933;
                border: 1px solid #339933;
                box-shadow: 0 0 5px rgba(0, 255, 0, .3),
                0 0 10px rgba(0, 255, 0, .2),
                0 0 15px rgba(0, 255, 0, .1),
                0 2px 0 black;
            }
            .link {
                margin-top: 25px;
                color: #868686;
            }
            .link a {
                color: #339933;
                text-decoration: none;
            }
            .link a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
    <div class="login-form">
        <div class="text">
            REGISTER
        </div>
        <form action="registration_form.php" method="POST">
            <div class="field">
                <div class="fas fa-user"></div>
                <input type="text" placeholder="First Name" name="firstname" required>
            </div>
            <div class="field">
                <div class="fas fa-user"></div>
                <input type="text" placeholder="Last Name" name="lastname" required>
            </div>
            <input type="hidden" name="form_submitted" value="1">
            <button type="submit">REGISTER</button>
        </form>
    </div>
    </body>
    </html>
    <?php
}
?>
