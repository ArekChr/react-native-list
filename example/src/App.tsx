import { StyleSheet } from 'react-native';
import { ListView } from 'react-native-list';

export default function App() {
  const mockData = Array.from({ length: 1000 }, (_, i) => String(i));
  return <ListView items={mockData} style={styles.box} />;
}

const styles = StyleSheet.create({
  box: {
    flex: 1,
    backgroundColor: 'red',
  },
});
