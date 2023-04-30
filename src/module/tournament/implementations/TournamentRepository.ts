import prismaCliente from "@/prisma";
import ICreateTournamentDTO from "../dtos/ICreateTournamentDTO";
import ITouramentRepository from "../repository/ITournamentRepository";
import { Tournaments } from "@prisma/client";

export default class TournamentRepository implements ITouramentRepository {
  async list(): Promise<Tournaments[]> {
    const tournaments = await prismaCliente.tournaments.findMany();
    return tournaments;
  }
  async create(tournament: ICreateTournamentDTO): Promise<Tournaments> {
    const tournamentCreated = await prismaCliente.tournaments.create({
      data: tournament,
    });
    return tournamentCreated;
  }
}
