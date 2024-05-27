import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Album } from './entities/album.entity';
import { Repository } from 'typeorm';
import { AlbumsQueryDto } from './dto/album-query.dto';

@Injectable()
export class AlbumService {
  constructor(
    @InjectRepository(Album) private albumRepository: Repository<Album>,
  ) {}

  async findAll(getAlbumsDto: AlbumsQueryDto): Promise<Album[]> {
    const { search, skip, take } = getAlbumsDto;
    const query = this.albumRepository.createQueryBuilder('album');

    if (search) {
      query.andWhere('album.name ILIKE :search', { search: `%${search}%` });
    }

    query.skip(skip).take(take);

    return await query.getMany();
  }

  // Get all albums with their songs and artist data
  async getAllAlbumsWithSongsAndArtists(): Promise<Album[]> {
    return await this.albumRepository
      .createQueryBuilder('album')
      .leftJoinAndSelect('album.songs', 'song')
      .leftJoinAndSelect('song.artist', 'artist')
      .leftJoinAndSelect('artist.artistDetails', 'details')
      .getMany();
  }
}
