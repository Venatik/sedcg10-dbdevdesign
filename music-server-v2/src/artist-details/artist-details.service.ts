import { Injectable } from '@nestjs/common';
import { CreateArtistDetailDto } from './dto/create-artist-detail.dto';
import { UpdateArtistDetailDto } from './dto/update-artist-detail.dto';

@Injectable()
export class ArtistDetailsService {
  create(createArtistDetailDto: CreateArtistDetailDto) {
    return 'This action adds a new artistDetail';
  }

  findAll() {
    return `This action returns all artistDetails`;
  }

  findOne(id: number) {
    return `This action returns a #${id} artistDetail`;
  }

  update(id: number, updateArtistDetailDto: UpdateArtistDetailDto) {
    return `This action updates a #${id} artistDetail`;
  }

  remove(id: number) {
    return `This action removes a #${id} artistDetail`;
  }
}
