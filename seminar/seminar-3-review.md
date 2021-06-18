# SOPT 28기 iOS 3차 세미나 - Review

<img src="https://user-images.githubusercontent.com/28949235/122500470-d1638c80-d02d-11eb-840b-8eab5d0a7682.png" alt="image" width=300px />

이런 뷰를 구현하려면?   
아래는 CollectionVIew인데... CollectionView는 TableView처럼 UIView를 헤더로 올리기 쉽지 않음.  
(가로 길이 때문에 맞추기 까다로움)  
--> **Collection Reusable View** 사용

오브젝트 라이브러리에서 끌어서 VC에 놓고,  
Identifier를 설정하고 아래의 코드로 Supplementary View 구현

```swift
func collectionView(_ collectionView: UIcollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath; IndexPath) -> UICollectionReusableVIew {
  switch kind {
    case UICollectionView.elementKindSectionHeader:
    	let headerView = collectionView.dequeueResuableSupplementaryView(OfKind: kind,
                                    withReuseIdentifier: "reusableView", for: indexPath)
    	return headerView
    
    default: assert(false, "에러")
  }
}
```

<img src="https://user-images.githubusercontent.com/28949235/122500859-8b5af880-d02e-11eb-9dbb-db730a5611be.png" alt="image" width=400px />

> 실제 라인 구현 모습

