import UIKit
import AVKit
import AVFoundation

struct Image {
    var follow : Int
    var view : Int
    var name : String
    init(_follow : Int, _view : Int, _name : String) {
        self.follow = _follow
        self.view = _view
        self.name = _name
    }
}
struct LiveImage {
    var follow : Int
    var view : Int
    var name : String
    var url : String
    init(_follow : Int, _view : Int, _name : String, _url : String) {
        self.follow = _follow
        self.view = _view
        self.name = _name
        self.url = _url
    }
}
class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var horizonCollectionView: UICollectionView!
    
    var imageList = [Image]()
    var liveImageList = [LiveImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let image1 = Image(_follow: 121, _view: 132, _name: "image1")
        let image2 = Image(_follow: 122, _view: 12, _name: "image2")
        let image3 = Image(_follow: 25, _view: 211, _name: "image3")
        let image4 = Image(_follow: 252, _view: 76, _name: "image4")
        let image5 = Image(_follow: 21, _view: 84, _name: "image5")
        let image6 = Image(_follow: 353, _view: 8, _name: "image6")
        let image7 = Image(_follow: 24, _view: 135, _name: "image7")
        
        imageList = [
            image1,image2, image3, image4, image5, image6, image7
        ]
        
        let image8 = LiveImage(_follow: 221, _view: 1002, _name: "image8", _url: "https://youtu.be/MJGexc1sKHQ")
        let image9 = LiveImage(_follow: 51, _view: 152, _name: "image9", _url: "https://youtu.be/MJGexc1sKHQ")
        let image10 = LiveImage(_follow: 501, _view: 2002, _name: "image10", _url: "https://youtu.be/MJGexc1sKHQ")
        let image11 = LiveImage(_follow: 566, _view: 252, _name: "image11", _url: "https://youtu.be/MJGexc1sKHQ")
        let image12 = LiveImage(_follow: 2211, _view: 95, _name: "image12", _url: "https://youtu.be/MJGexc1sKHQ")
        
        liveImageList = [
            image8, image9, image10, image11, image12
        ]
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView {
            return imageList.count
        }else {
            return liveImageList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
            let image = imageList[indexPath.row]
            cell.imageView.image = UIImage(named: image.name)
            cell.followCnt.text = String(image.follow)
            cell.viewCnt.text = String(image.view)
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell2", for: indexPath) as! HorizonCollectionCell
            let image = liveImageList[indexPath.row]
            cell.imageView.image = UIImage(named: image.name)
            cell.followCnt.text = String(image.follow)
            cell.viewCnt.text = String(image.view)
            return cell
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailView"{
            
            let detailVC = segue.destination as! DetailViewController

            if let cell = sender as? CollectionViewCell {
                if let indexPath = collectionView.indexPath(for: cell) {
                    let image = imageList[indexPath.row]
                    detailVC._imageName = image.name
                    detailVC._follow = "\(image.follow)"
                    detailVC._view = "\(image.view)"
                }
            }
        }else if segue.identifier == "AVPlayerView"{
            let avPlayerVC = segue.destination as! AVPlayerViewController
            
            var url : String = "";
            if let cell = sender as? HorizonCollectionCell {
                if let indexPath = horizonCollectionView.indexPath(for: cell) {
                    let image = liveImageList[indexPath.row]
                    url = image.url
                }
            }
            
            let player = AVPlayer(url: URL(string: url)!)
            let playerController = AVPlayerViewController()
            
            avPlayerVC.player = player
            self.addChildViewController(playerController)
            self.view.addSubview(playerController.view)
            playerController.view.frame = self.view.frame
            player.play()
        }
    }
    

}

