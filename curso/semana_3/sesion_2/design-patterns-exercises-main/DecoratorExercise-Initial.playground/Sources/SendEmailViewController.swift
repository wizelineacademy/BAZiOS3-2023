import UIKit

public class SendEmailViewController: UIViewController {

    public weak var sendEmailDelegate: SendEmailDelegate?
    
    // MARK: Views
    private var sendEmailButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Enviar Email", for: .normal)
        return button
    }()

    public override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setSendEmailTarget()
    }

    public override func viewDidLayoutSubviews() {
        sendEmailButton.frame = CGRect(x: 0, y: 0, width: 120, height: 50)
        sendEmailButton.center =  CGPoint(x: view.bounds.width / 2, y: view.bounds.height / 2)
    }
    
    private func addSubviews() {
        view.addSubview(sendEmailButton)
    }
    
    private func setSendEmailTarget() {
        sendEmailButton.addTarget(self, action: #selector(didTapSendEmailButton), for: .touchUpInside)
    }
    
    @objc private func didTapSendEmailButton() {
        sendEmailDelegate?.didSendEmail()
    }
}
