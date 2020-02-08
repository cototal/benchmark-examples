<?php

namespace App\Controller;

use App\Entity\Post;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends AbstractController
{
    /**
     * @var EntityManagerInterface
     */
    private $em;

    public function __construct(EntityManagerInterface $em)
    {
        $this->em = $em;
    }


    /**
     * @Route("", name="home")
     */
    public function index(Request $request)
    {
        $email = $request->query->get("email");
        $list = $this->em->getRepository(Post::class)->findByAuthor($email);
        return $this->json($list, 200, [], [
            "groups" => ["list"]
        ]);
    }
}
