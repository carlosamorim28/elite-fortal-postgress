// Next.js API route support: https://nextjs.org/docs/api-routes/introduction
import ICreateTournamentDTO from "@/module/tournament/dtos/ICreateTournamentDTO";
import TournamentRepository from "@/module/tournament/implementations/TournamentRepository";
import CreateTournamentUseCase from "@/module/tournament/useCases/createTournamentUseCase";
import ListTournamentUseCase from "@/module/tournament/useCases/listTournamentsUseCase";
import InterfaceCreateUsersDtos from "@/module/users/dtos/InterfaceCreateUserDtos";
import UserRepostory from "@/module/users/implementations/UserRepository";
import CreateUserUseCase from "@/module/users/usecases/create-user/CreateUserUseCase";
import prismaCliente from "@/prisma";
import type { NextApiRequest, NextApiResponse } from "next";

const usersRepository = new UserRepostory();

export default function handler(
  req: NextApiRequest,
  res: NextApiResponse<any>
) {
  method[req.method as "GET" | "POST"](req, res);
}

async function get(req: NextApiRequest, res: NextApiResponse<any>) {
  const tournamentRepository = new TournamentRepository();
  const listTournamentsUseCase = new ListTournamentUseCase(
    tournamentRepository
  );
  const tournaments = await listTournamentsUseCase.execute();
  res.status(200).send(tournaments);
}

async function post(req: NextApiRequest, res: NextApiResponse<any>) {
  const newTournament: ICreateTournamentDTO = req.body;
  const tournamentRepository = new TournamentRepository();
  const createTournamentUseCase = new CreateTournamentUseCase(
    tournamentRepository
  );
  const tournamentCreated = await createTournamentUseCase.execute(
    newTournament
  );
  res.status(200).send(tournamentCreated);
}

const method = {
  GET: get,
  POST: post,
};
