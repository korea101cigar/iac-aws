provider "aws" {
  region = "us-west-2"
}

# aws_instance是资源类型  ， ecs-worker1是资源名称
resource "aws_instance" "ecs-worker1" {
  # ami 指操作系统的镜像id
  ami = "ami-075e056c0f3d02523"
  instance_type = "t2.micro" # 实例类型
  key_name = aws_key_pair.ssh.key_name
}


resource "aws_key_pair" "ssh" {
  key_name = "admin"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCzOzxJL/mfECQrdgReHKXZYQHlM4ZWrCGnmckFbFm2TPMFTPQ32eSLnct5a7uEfpMINu3jOafrOAXcSUZ4+QIp9fbnl3ztO1AsZ5w7VRiXe6yYkokxWciPDu/HeM9jl1rOmoRWz+41gg/xqouAqauA8YBv9IbTbI+gQrlIuB+W6EmNsvL3LmNO1BSxxJnKqUs0wDOwgFNf1o7XCuXRBlv+4aECP2DQVX7Du38LsX/zB/cRr5H4tzKgPBF6NffwAQQuLa7KZkN0udiyYuyB85xLnFSBPQKVY3ZqP7zZ56VHgO8W6wHJaYQgp+nYk7Wo17qwFU5mlN3VWfEb6o/y7v+wc544SBgFeDVfPxKiA4iJ9f4g7gqBw56olYxb1cQ+YcnHMvsVF0eEdWi3deJPSzF/TaTzH1AieKwhE3sCbrQYzgiNeTIFLJ4MI4NN0TVIQnPl7X0ZbS0kKOUdRpmd4L3xkDr8ip6J5XVwQkLU4m1WoZRlBfDsrE9sy7ARc8sHAz4vGIbt9nkuT0mu9TuetJUcKM+4QQi3QXf7ztx7q6L1RV19G2sXKyhh8HwlXc5lw6rc9XVgxf3g/V+Ka2s6e5vj6+PYMABUtrEkWoh2usiM1MW7ttBH+9wpx15IWR0l6Ajks5H7U4Je1KFXg9gZPQcxrnyRXU7jbTtQd+qvso5dPw== Administrator@DESKTOP-MASFJV7"
}

resource "aws_security_group_rule" "ssh" {
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = "sg-09c34a549515695db"
}