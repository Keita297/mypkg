import rclpy
from rclpy.node import Node
from std_msgs.msg import Int16, String

class CountMonitor(Node):
    def __init__(self):
        super().__init__('count_monitor')
        self.prev = None

        self.sub = self.create_subscription(
            Int16, 'countup', self.cb, 10)

        self.pub = self.create_publisher(
            String, 'count_status', 10)

    def cb(self, msg):
        status = String()

        if self.prev is None:
            status.data = 'start'
        elif msg.data > self.prev:
            status.data = 'increasing'
        elif msg.data == self.prev:
            status.data = 'stopped'
        else:
            status.data = 'decreasing'

        self.pub.publish(status)
        self.get_logger().info(
            f'count={msg.data}, status={status.data}')

        self.prev = msg.data


def main():
    rclpy.init()
    node = CountMonitor()
    rclpy.spin(node)

