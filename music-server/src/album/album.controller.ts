import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
  ValidationPipe,
  Query,
} from '@nestjs/common';
import { AlbumService } from './album.service';
import { ApiOkResponse, ApiOperation, ApiTags } from '@nestjs/swagger';
import { Album } from './entities/album.entity';
import { AlbumsQueryDto } from './dto/album-query.dto';

@ApiTags('album')
@Controller('album')
export class AlbumController {
  constructor(private readonly albumService: AlbumService) {}

  @Get()
  @ApiOperation({ summary: 'Get a list of albums.' })
  @ApiOkResponse({ description: 'List of albums.', type: [Album] })
  async getAlbums(
    @Query(ValidationPipe) getAlbumsDto: AlbumsQueryDto,
  ): Promise<Album[]> {
    return this.albumService.findAll(getAlbumsDto);
  }
}
